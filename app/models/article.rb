class Article < ActiveRecord::Base
  attr_accessible :active, :allow_comments, :article_image, :body, :title

  validates_presence_of :title, :body
  validates_uniqueness_of :title
end
