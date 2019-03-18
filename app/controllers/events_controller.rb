class EventsController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  def index
    smart_listing_create :events, 
                         Event.active, 
                         partial: "events/list", 
                         default_sort: {name: "asc"}
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.create(user_params)
  end
  
  def edit
  end
  
  def update
    @event.update_attributes(event_params)
  end
  
  def destroy
    @event.destroy
  end
  
  def credit_card_switch
    @event.toggle :credit_card
  end
  
  private
  
  def find_user
    @event = Event.find(params[:id])
  end
  
  def event_params
    params.require(:event).permit(:name, :description, :location, :price, :starts_at, :image_file_name, :capacity)
  end
end


