class UsersController < ApplicationController

  def index
     current_user_id = User.find params[:id]
     lat = params[:lat]
     lng = params[:lng]
     @users = User.within(0.01, :origin => [lat, lng]).where.not(id: current_user_id)
     #.order('distance DESC') Need to add column distance to do this
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
      render :show, status: 200
    else
      render json: { error: @user.errors }, status: 422
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
  end

  def share
    current_user = User.find params[:my_id]
    user = User.find params[:user_id]

    current_user.outbound_shares << { user: { id: user.id, email: user_params[:email] } }
    user.inbound_shares << { user: { id: current_user.id, email: user_params[:email] } }

    if current_user.save && user.save
      render json: { success: "You win at life" }, status: 200
    else
      render json: { error: "Failed to achieve victory, please try again" }, status: 422
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :email)
    end

end
