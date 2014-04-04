class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_dynamic_content

  def get_dynamic_content
    @side_upcoming_events = Event.upcoming
    @site_name = DynamicContent.get_value(:home_content)
  end
end
