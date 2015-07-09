class UsersController < ApplicationController

  def index
    # lat = current_user.latitude
    # long = current_user.longitude
    lat = User.first.latitude
    long = User.first.longitude
    @users = User.near([lat, long], 0.1)
  end

  def show
    @user = User.find params[:id]
  end

  def create
    @user = User.new user_params
    if @user.save
      render :show, status: 201
    else
      render json: { error: @user.errors }, status: 422
    end
  end

  def login
    @user = User.find_by email: user_params[:email]
    if @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      render :show
    else
      render json: { error: "incorrect email/password combination" }, status: 422
    end
  end

  def update
    @user = User.find params[:id]
    if @user.update user_params
      render :show, status: 201
    else
      render json: { error: @user.errors }, status: 422
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :company, :city, :state, :facebook, :twitter, :linkedin, :github, :instagram)
    end

end
