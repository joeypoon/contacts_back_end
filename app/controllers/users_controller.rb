class UsersController < ApplicationController

  def index
    # lat = params[:lat]
    # long = params[:long]
    # @users = User.near([lat, long], 0.1)
    @users = User.all
  end

  def show
    @user = current_user
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
    current_user.destroy
  end

  def share
    me = current_user
    user = User.find params[:user_id]

    me.outbound_shares << { user: { id: user.id, email: user_params[:email] } }
    user.inbound_shares << { user: { id: current_user.id, email: user_params[:email] } }

    if me.save && user.save
      render json: { success: "You win at life" }, status: 200
    else
      render json: { error: "Failed to achieve victory, please try again" }, status: 422
    end
  end

  def inbound
    inbound_ids = current_user.inbound_shares.map { |share| share["user"]["id"] }
    @users = User.where(id: inbound_ids)
    render :index
  end

  def outbound
    outbound_ids = current_user.outbound_shares.map { |share| share["user"]["id"] }
    @users = User.where(id: outbound_ids)
    render :index
  end

  private

    def current_user
      User.find params[:id]
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :email)
    end

end
