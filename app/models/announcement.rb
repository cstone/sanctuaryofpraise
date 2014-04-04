class Announcement < ActiveRecord::Base
  attr_accessible :content, :expires, :title

  after_save :delete_inactive

  default_scope order('created_at DESC')

  scope :active, where("expires >= ?", Time.now).order('created_at DESC')
  scope :inactive, where("expires <= ?", Time.now)


  def delete_inactive
    Announcement.inactive.destroy_all
  end
end
