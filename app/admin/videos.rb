ActiveAdmin.register Video do


  index do
    selectable_column
    column :title
    column :description do |description|
      description.description.truncate(75)
    end
    column :source
    column :allow_comments
    actions
  end


  form do |f|
    f.inputs do
      f.input :title
      f.input :description, :as => :ckeditor, :input_html => { :ckeditor => { :height => 400 } }
      f.input :source
      f.input :allow_comments
    end
    f.actions
  end



  show do |video|
    attributes_table do
      row :id
      row :title
      row :description do
        video.description.html_safe
      end
      row :source
      row :allow_comments
      row :created_at do
        video.created_at.to_formatted_s(:default)
      end
      row :updated_at do
        video.updated_at.to_formatted_s(:default)
      end
    end
    active_admin_comments
  end

  
end
