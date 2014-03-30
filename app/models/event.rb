class Event < ActiveRecord::Base
  attr_accessible :address, :city, :description, :state, :time, :title, :url, :venue, :zip

  scope :active, where("time >= ?", Time.now).order("time")
  scope :upcoming, where("time >= ?", Time.now).order("time").limit(3)
  scope :next_event, where("time >= ?", Time.now).order("time").limit(1)
end
