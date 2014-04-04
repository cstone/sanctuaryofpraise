class PrayerRequest < ActiveRecord::Base
  attr_accessible :approved, :content, :title, :allow_comments
end
