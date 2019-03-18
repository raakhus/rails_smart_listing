class UsersController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  before_filter :find_user, except: [:index, :new, :create]
  def index
    smart_listing_create :users, 
                         User.active, 
                         partial: "users/list", 
                         default_sort: {name: "asc"}
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)
  end
  
  def edit
  end
  
  def update
    @user.update_attributes(user_params)
  end
  
  def destroy
    @user.destroy
  end
  
  def credit_card_switch
    @user.toggle :credit_card
  end
  
  private
  
  def find_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :location, :phone, 
                                 :credit_card, :saldo, :session_id)
  end
end
