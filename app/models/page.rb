class Page < ActiveRecord::Base
  attr_accessible :content, :page_image, :permalink, :title, :remove_page_image
end
