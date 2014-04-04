class AnnouncementsController < ApplicationController
  # GET /articles
  # GET /articles.json
  def index
    @announcements = Announcement.active.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @announcements }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @announcement = Announcement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @announcement }
    end
  end
end

