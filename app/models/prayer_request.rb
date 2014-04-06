class PrayerRequest < ActiveRecord::Base
  attr_accessible :approved, :content, :title, :allow_comments

  scope :active, where(approved: true)

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
