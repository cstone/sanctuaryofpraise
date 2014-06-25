ActiveAdmin.register Article do

  form do |f|
    f.inputs do
      f.input :title
      f.input :body, :as => :ckeditor, :input_html => { :ckeditor => { :height => 400 } }
      f.input :article_image, :as => :file, :hint => f.object.article_image.present? \
    ? f.template.image_tag(f.object.article_image.url(:thumb))
      : f.template.content_tag(:span, "no photo yet")
      f.input :article_image_cache, :as => :hidden
      f.input :remove_article_image, as: :boolean, label: 'Check here to remove the current image.'
      f.input :allow_comments
      f.input :active
    end
    f.actions
  end


  index do
    selectable_column
    column :article_image do |article|
      if article.article_image.url
        image_tag article.article_image.url(:thumb)
      end
    end
    column :title
    column :body do |body|
      body.body.truncate(75).html_safe
    end
    actions
  end


  show do |article|
    attributes_table do
      row :id
      row :title
      row :body do
        article.body.html_safe
      end
      row :article_image do
        if article.article_image.url
          image_tag article.article_image.url
        end
      end
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
