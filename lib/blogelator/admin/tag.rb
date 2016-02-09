if defined?(ActiveAdmin)
  ActiveAdmin.register Blogelator::Tag, as: "Tag" do
    permit_params [
      :name,
      :slug
    ]

    controller do
      defaults finder: :find_by_slug!
    end

    filter :name

    index do
      selectable_column
      column :id
      column :name do |tag|
        link_to tag.name, admin_tag_path(tag)
      end
      column :created_at
      column :updated_at
    end

    form do |f|
      inputs "#{t('activerecord.models.tag', count: 1)} Details" do
        input :name, input_html: { class: "title-to-slug-title" }
        input :slug, input_html: { class: "title-to-slug-slug" }
      end

      actions
    end

    show do
      attributes_table do
        row :name
        row :slug
        row :created_at
        row :updated_at
      end
      active_admin_comments
    end
  end
end
