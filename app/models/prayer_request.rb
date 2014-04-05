class PrayerRequest < ActiveRecord::Base
  attr_accessible :approved, :content, :title, :allow_comments

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
