class Page < ActiveRecord::Base
  attr_accessible :content, :page_image, :permalink, :title, :remove_page_image

  validates_presence_of :title, :permalink, :content

  mount_uploader :page_image, PageImageUploader
end
