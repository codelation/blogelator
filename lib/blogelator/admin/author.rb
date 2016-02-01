if defined?(ActiveAdmin)
  ActiveAdmin.register Blogelator::Author, as: "Author" do
    permit_params [
      :bio_markdown,
      :cover_photo,
      :location,
      :meta_description,
      :meta_keywords,
      :name,
      :profile_photo,
      :slug,
      :website
    ]

    controller do
      defaults finder: :find_by_slug!
    end

    filter :name
    filter :bio_html
    filter :location
    filter :website

    index do
      selectable_column
      column :id
      column :title do |author|
        link_to author.name, admin_author_path(author)
      end
      column :created_at
      column :updated_at
    end

    form do |f|
      inputs "#{t('activerecord.models.author', count: 1)} Details" do
        input :name, input_html: { class: "title-to-slug-title" }
        input :bio_markdown, as: :codemirror, codemirror: { mode: "gfm" }
        input :profile_photo, as: :file
        input :cover_photo, as: :file
        input :location
        input :website
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
        row :name
        row :location
        row :website
        row :created_at
        row :updated_at
        row :bio do |author|
          raw author.bio_html
        end
      end
      active_admin_comments
    end
  end
end
