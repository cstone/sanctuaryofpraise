class PrayerRequest < ActiveRecord::Base
  attr_accessible :approved, :content, :title, :allow_comments

  validates_presence_of :title, :content

  default_scope order('created_at DESC')
  scope :active, where(approved: true)

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
