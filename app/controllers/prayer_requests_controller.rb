class PrayerRequestsController < ApplicationController

  def index
    @prayer_requests = PrayerRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @prayer_requests }
    end
  end


  def show
    @prayer_request = PrayerRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prayer_request }
    end
  end

  # GET /prayer/new
  # GET /events/new.json
  def new
    @prayer_request = PrayerRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prayer_request }
    end
  end


  # POST /events
  # POST /events.json
  def create
    @prayer_request = PrayerRequest.new(params[:event])

    respond_to do |format|
      if @prayer_request.save
        format.html { redirect_to @prayer_request, notice: 'PrayerRequest was successfully created.' }
        format.json { render json: @prayer_request, status: :created, location: @prayer_request }
      else
        format.html { render action: "new" }
        format.json { render json: @prayer_request.errors, status: :unprocessable_entity }
      end
    end
  end

end
