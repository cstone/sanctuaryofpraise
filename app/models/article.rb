class Article < ActiveRecord::Base
  attr_accessible :active, :allow_comments, :article_image, :body, :title, :article_image_cache, :remove_article_image

  mount_uploader :article_image, ArticleImageUploader

  default_scope order("created_at DESC")

  scope :active,  where(active: true)

  validates_presence_of :title, :body
  validates_uniqueness_of :title

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
