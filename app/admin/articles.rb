ActiveAdmin.register Article do

  form do |f|
    f.inputs do
      f.input :title
      f.input :body, as: :html_editor
      f.input :article_image
      f.input :allow_comments
      f.input :active
    end
    f.actions
  end


  index do
    selectable_column
    column :article_image
    column :title
    column :body do |body|
      body.body.truncate(75).html_safe
    end
    default_actions
  end


  show do |article|
    attributes_table do
      row :id
      row :title
      row :body do
        article.body.html_safe
      end
      row :article_image
      row :allow_comments
      row :active
      row :created_at do
        article.created_at.to_formatted_s(:default)
      end
      row :updated_at do
        article.updated_at.to_formatted_s(:default)
      end
    end
    active_admin_comments
  end
  
end
