class Photo < ActiveRecord::Base
  attr_accessible :allow_comments, :description, :photo_image, :title, :remove_photo_image, :photo_image_cache

  mount_uploader :photo_image, PhotoImageUploader

  validates_presence_of :photo_image, :title, :description

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def previous_photo
    self.class.where("id < ?", id).order("id DESC").first
  end

  def next_photo
    self.class.where("id > ?", id).first
  end

end
