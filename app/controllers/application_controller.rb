class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_dynamic_content

  def get_dynamic_content
    @side_upcoming_events = Event.upcoming
    @side_announcements = Announcement.featured
    @site_name = DynamicContent.get_value(:site_name)
    @footer_address = DynamicContent.get_value(:footer_address)
    @home_content = DynamicContent.get_value(:home_content).html_safe
    @events_home = DynamicContent.get_value(:events_home).html_safe
    @blog_home = DynamicContent.get_value(:blog_home).html_safe
    @prayer_home = DynamicContent.get_value(:prayer_home).html_safe
    @announcements_home = DynamicContent.get_value(:announcements_home).html_safe
    @photos_home = DynamicContent.get_value(:photos_home).html_safe
    @videos_home = DynamicContent.get_value(:videos_home).html_safe
    @visitors = DynamicContent.get_value(:visitors).html_safe
    @visitors_title = DynamicContent.get_title(:visitors).html_safe
    @about_sopf = DynamicContent.get_value(:about_sopf).html_safe
    @about_sopf_title = DynamicContent.get_title(:about_sopf).html_safe
    @location = DynamicContent.get_value(:location).html_safe
    @location_title = DynamicContent.get_title(:location).html_safe
    @service_time = DynamicContent.get_value(:service_time).html_safe
    @service_time_title = DynamicContent.get_title(:service_time).html_safe
  end
end
