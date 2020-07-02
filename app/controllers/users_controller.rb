class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #log in
      session[:user_id] = @user.id
      #redirect to the show page
      redirect_to @user
    else
      render new
    end
  end

  def show
    user = User.find_by_id(params[:id])
    # redirect_to '/' if !@user
    render json: user, only: [:id, :username, :email]
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end

end
