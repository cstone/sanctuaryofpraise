ActiveAdmin.register Page do


  index do
    selectable_column
    column :title do |content|
      content.title.truncate(50).html_safe
    end
    column :permalink
    column :content do |content|
      content.content.truncate(75).html_safe
    end
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :permalink
      f.input :content, as: :html_editor
      f.input :page_image, :as => :file, :hint => f.object.page_image.present? \
    ? f.template.image_tag(f.object.page_image.url(:thumb))
      : f.template.content_tag(:span, "no photo yet")
      f.input :page_image_cache, :as => :hidden
      f.input :remove_page_image, as: :boolean, label: 'Check here to remove the current image.'
    end
    f.actions
  end


  show do |page|
    attributes_table do
      row :id
      row :title
      row :permalink
      row :content do
        page.content.html_safe
      end
      row :created_at do
      page.created_at.to_formatted_s(:default)
    end
      row :updated_at do
        page.updated_at.to_formatted_s(:default)
      end
    end
    active_admin_comments
  end


end
