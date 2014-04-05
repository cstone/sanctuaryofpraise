ActiveAdmin.register Event do

  # controller do
  #   defaults :finder => :find_by_title
  # end

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
        simple_format event.description
      end
      row :venue
      row :address
      row :city
      row :state
      row :zip
      row :url
      row :time
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
