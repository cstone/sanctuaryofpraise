class Photo < ActiveRecord::Base
  attr_accessible :allow_comments, :description, :photo_image, :title, :remove_photo_image

  mount_uploader :photo_image, PhotoImageUploader

  validates_presence_of :photo_image
end
