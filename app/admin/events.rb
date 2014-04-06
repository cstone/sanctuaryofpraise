ActiveAdmin.register Event do


  index do
    selectable_column
    column :title
    column :time
    default_actions
  end


  form do |f|
    f.inputs do
      f.input :title
      f.input :description, as: :html_editor
      f.input :venue
      f.input :address
      f.input :city
      f.input :state
      f.input :zip
      f.input :url
      f.input :time, :as => :just_datetime_picker
    end
    f.actions
  end


  show do |event|
    attributes_table do
      row :id
      row :title
      row :description do
        event.description.html_safe
      end
      row :venue
      row :address
      row :city
      row :state
      row :zip
      row :url
      row :time do
        event.time.to_formatted_s(:default)
      end
      row :created_at do
        event.created_at.to_formatted_s(:default)
    end
      row :updated_at do
        event.updated_at.to_formatted_s(:default)
      end
    end
    active_admin_comments
  end
end
