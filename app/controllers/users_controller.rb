class UsersController < ApplicationController
  before_action :authenticate_user
  before_action :only_see_own_page, only: [:show]

  def show
    @user = User.find(params[:id])

    @event = Event.all
    
    
  end

  def only_see_own_page
    @user = User.find(params[:id])
  
    if current_user != @user
      redirect_to root_path, notice: "Sorry, but you are only allowed to view your own profile page."
    end
  end
  

  private
  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end
