ActiveAdmin.register Photo do

  form do |f|
    f.inputs do
      f.input :title
      f.input :description, as: :html_editor
      f.input :photo_image, :as => :file, :hint => f.object.photo_image.present? \
    ? f.template.image_tag(f.object.photo_image.url(:thumb))
      : f.template.content_tag(:span, "no photo yet")
      f.input :photo_image_cache, :as => :hidden
    end
    f.inputs "Remove Current Image" do
      f.input :remove_photo_image, as: :boolean, label: 'Check here to remove the current image.'
    end
    f.actions
  end


  index do
    selectable_column
    column :photo_image do |photo|
      image_tag photo.photo_image.url(:thumb)
    end
    column :title do |title|
      title.title.truncate(50)
    end
    column :descripton do |description|
      description.description.truncate(75)
    end
    column :allow_comments
    default_actions
  end

  filter :title
  filter :content
  filter :expires
  filter :allow_comments



  show do |photo|
    attributes_table do
      row :id
      row :title
      row :description do
        photo.description.html_safe
      end
      row :photo_image do
        image_tag photo.photo_image.url
      end
      row :created_at do
        photo.created_at.to_formatted_s(:default)
      end
      row :updated_at do
        photo.updated_at.to_formatted_s(:default)
      end
    end
    active_admin_comments
  end
  
end
