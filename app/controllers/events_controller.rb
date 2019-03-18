class EventsController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  def index
    @time = Time.now
    @events = Event.upcoming
  end
  def show
    @event = Event.find(params[:id])
  end
  def edit
    @event = Event.find(params[:id])
  end
  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    if @event.update(event_params)
      flash[:notice] = "Event successfully updated"
      redirect_to @event
    else
      render :new
    end
  end
  def new
    @event = Event.new
  end
  def create
    @event = Event.new(event_params)
   if @event.save
    flash[:notice] = "Event successfully saved"
     redirect_to @event
   else
     render :new
   end
  end
  def destroy
    @event = Event.find(params[:id])
   if @event.destroy
    flash[:notice] = "Event successfully deleted"
    redirect_to events_url
   end
  end
  def previous
    @events = Event.previous
    @time = Time.now
  end
  def all
    @events = Event.all
    @time = Time.now
  end
  private
    def event_params
      params.require(:event).permit(:name, :desciption, :location, :price, :starts_at, :image_file_name, :capacity)
    end
end

