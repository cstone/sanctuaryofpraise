ActiveAdmin.register Announcement do

  index do
    selectable_column
    column :title do |title|
      title.title.truncate(50)
    end
    column :content do |content|
      content.content.truncate(50)
    end
    column :expires do |expire|
      expire.expires.to_formatted_s(:default)
    end
    column :allow_comments
    default_actions
  end

  filter :title
  filter :content
  filter :expires
  filter :allow_comments





  form do |f|
    f.inputs do
      f.input :title
      f.input :content, as: :html_editor
      f.input :expires, as: :just_datetime_picker
      f.input :allow_comments
    end
    f.actions
  end

end
