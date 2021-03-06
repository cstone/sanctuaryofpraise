class Announcement < ActiveRecord::Base
  attr_accessible :content, :expires, :title, :allow_comments

  just_define_datetime_picker :expires, :add_to_attr_accessible => true

  validates_presence_of :title, :content

  after_save :delete_inactive

  default_scope order('created_at DESC')

  scope :active, where("expires >= ?", Time.now).order('created_at DESC')
  scope :inactive, where("expires <= ?", Time.now)
  scope :featured, where("expires >= ?", Time.now).order('created_at DESC').limit(2)


  def delete_inactive
    Announcement.inactive.destroy_all
  end


  def to_param
    "#{id}-#{title.parameterize}"
  end
end
