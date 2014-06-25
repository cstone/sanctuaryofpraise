ActiveAdmin.register DynamicContent do

  form do |f|
    f.inputs do
      f.input :title
      f.input :key
      f.input :value, :as => :ckeditor, :input_html => { :ckeditor => { :height => 400 } }
    end
    f.actions
  end


  index do
    selectable_column
    column :title
    column :key
    column :value do |value|
      value.value.truncate(75).html_safe
    end
    actions
  end

  filter :title
  filter :key
  filter :value


  show do |content|
    attributes_table do
      row :id
      row :title
      row :key
      row :value do
        content.value.html_safe
      end
      row :created_at do
        content.created_at.to_formatted_s(:default)
      end
      row :updated_at do
        content.updated_at.to_formatted_s(:default)
      end
    end
    active_admin_comments
  end

end
