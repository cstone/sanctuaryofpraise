ActiveAdmin.register Page do


  index do
    selectable_column
    column :title
    column :permalink
    column :content do |content|
      content.content.truncate(75)
    end
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :permalink
      f.input :content, as: :html_editor
    end
    f.inputs "Image" do
      f.file_field :page_image
    end
    #f.inputs "Remove Current Image" do
    #  f.input :remove_page_image, as: :boolean, label: 'Check here to remove the current image.'
    #end
    f.actions
  end


  show do |page|
    attributes_table do
      row :id
      row :title
      row :permalink
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
