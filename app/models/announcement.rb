class Announcement < ActiveRecord::Base
  attr_accessible :content, :expires, :title
end
