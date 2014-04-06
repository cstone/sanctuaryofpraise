class Photo < ActiveRecord::Base
  attr_accessible :allow_comments, :description, :photo_image, :title

  mount_uploader :photo_image, PhotoImageUploader

  validates_presence_of :photo_image
end
