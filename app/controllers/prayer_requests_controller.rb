class PrayerRequestsController < ApplicationController

  def index
    @prayer_requests = PrayerRequest.active.page(params[:page]).per(10)

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
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end


  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
end
