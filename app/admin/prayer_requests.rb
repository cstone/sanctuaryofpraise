ActiveAdmin.register PrayerRequest do

  form do |f|
    f.inputs do
      f.input :title
      f.input :content, :as => :ckeditor, :input_html => { :ckeditor => { :height => 400 } }
      f.input :allow_comments
      f.input :approved
    end
    f.actions
  end


  index do
    selectable_column
    column :title
    column :content do |content|
      content.content.truncate(75).html_safe
    end
    column :allow_comments
    column :approved
    actions
  end



  show do |prayer|
    attributes_table do
      row :id
      row :title
      row :content do
        prayer.content.html_safe
      end
      row :allow_comments
      row :approved
      row :created_at do
        prayer.created_at.to_formatted_s(:default)
      end
      row :updated_at do
        prayer.updated_at.to_formatted_s(:default)
      end
    end
    active_admin_comments
  end


end
