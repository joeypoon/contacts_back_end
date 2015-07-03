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
      render :show, status: 200
    else
      render json: { error: @user.errors }, status: 422
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :company, :city, :state, :facebook, :twitter, :linkedin, :github, :instagram)
    end

end
