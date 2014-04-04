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
    column :body
    default_actions
  end
  
end
