ActiveAdmin.register Page do


  index do
    selectable_column
    column :page_image do |page|
      if page.page_image.url
        image_tag page.page_image.url(:thumb)
      end
    end
    column :title do |content|
      content.title.truncate(50).html_safe
    end
    column :permalink
    column :content do |content|
      simple_format content.content.truncate(75)
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :permalink
      f.input :content, :as => :ckeditor, :input_html => { :ckeditor => { :height => 400 } }
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
      row :page_image do
        if page.page_image.url
          image_tag page.page_image.url
        end
      end
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
