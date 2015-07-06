class UsersController < ApplicationController

  def index
    @users = User.all
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
