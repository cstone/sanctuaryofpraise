ActiveAdmin.register Announcement do

  form do |f|
    f.inputs do
      f.input :title
      f.input :content, as: :html_editor
      f.input :expires, as: :just_datetime_picker
      f.input :allow_comments
    end
    f.actions
  end


  index do
    selectable_column
    column :title do |title|
      title.title.truncate(50)
    end
    column :content do |content|
      content.content.truncate(50)
    end
    column :expires do |expire|
      if expire.expires
        expire.expires.to_formatted_s(:default)
      end
    end
    column :allow_comments
    default_actions
  end

  filter :title
  filter :content
  filter :expires
  filter :allow_comments


  show do |announcement|
    attributes_table do
      row :id
      row :title
      row :content do
        announcement.content.html_safe
      end
      row :expires do
        announcement.expires.to_formatted_s(:default)
      end
      row :allow_comments
      row :created_at do
        announcement.created_at.to_formatted_s(:default)
      end
      row :updated_at do
        announcement.updated_at.to_formatted_s(:default)
      end
    end
    active_admin_comments
  end




end
