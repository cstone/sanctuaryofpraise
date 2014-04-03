class Event < ActiveRecord::Base
  attr_accessible :address, :city, :description, :state, :time, :title, :url, :venue, :zip

  just_define_datetime_picker :time, :add_to_attr_accessible => true

  validates_presence_of :title, :description, :time

  default_scope order('time ASC')

  scope :active, where("time >= ?", Time.now).order("time")
  scope :upcoming, where("time >= ?", Time.now).order("time").limit(5)
  scope :next_event, where("time >= ?", Time.now).order("time").limit(1)

end
