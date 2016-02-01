if defined?(ActiveAdmin)
  ActiveAdmin.register Blogelator::Post, as: "Post" do
    permit_params [
      :author_id,
      :body_markdown,
      :featured,
      :image,
      :meta_description,
      :meta_keywords,
      :published_at,
      :slug,
      :status,
      :summary_markdown,
      :title
      # category_ids: []
    ]

    controller do
      defaults finder: :find_by_slug!
    end

    filter :title
    filter :body_html
    filter :published_at
    # filter :categories

    index do
      selectable_column
      column :id
      column :title do |post|
        link_to post.title, admin_post_path(post)
      end
      column :created_at
      column :updated_at
    end

    form do |f|
      inputs "#{t('activerecord.models.post', count: 1)} Details" do
        input :title, input_html: { class: "title-to-slug-title" }
        input :image, as: :file
        input :body_markdown,    as: :codemirror, codemirror: { lineWrapping: true, mode: "gfm" }
        input :summary_markdown, as: :codemirror, codemirror: { lineWrapping: true, mode: "gfm" }
      end

      inputs "Publish Settings" do
        input :status, as: :select, collection: Blogelator::Post.statuses.map {|status| [status[0].titleize, status[0]] }, include_blank: false
        input :author, as: :select
        input :featured
        input :published_at, as: :datepicker
      end

      inputs "Search Engine Optimization" do
        input :meta_keywords
        input :meta_description
        input :slug, input_html: { class: "title-to-slug-slug" }
      end

      actions
    end

    show do
      attributes_table do
        row :title
        row :author
        row :status do
          post.status.titleize
        end
        row :url do
          a href: post.url, target: "_blank" do
            post.url
          end
        end
        row :published_at
        row :created_at
        row :updated_at
        row :summary do
          raw post.summary_html
        end
        row :content do
          raw post.body_html
        end
      end
      active_admin_comments
    end
  end
end
