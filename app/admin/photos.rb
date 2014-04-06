ActiveAdmin.register Photo do

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
