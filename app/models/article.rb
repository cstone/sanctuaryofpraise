class Article < ActiveRecord::Base
  attr_accessible :active, :allow_comments, :article_image, :body, :title

  default_scope order("created_at DESC")

  scope :active,  where(active: true)

  validates_presence_of :title, :body
  validates_uniqueness_of :title
end
