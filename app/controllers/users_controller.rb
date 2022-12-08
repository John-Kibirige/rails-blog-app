class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = "These are the details of only one user whose id is #{params[:id]}"
  end
end
