class UsersController < ApplicationController

  def index
     current_user_id = User.find params[:id]
     lat = params[:lat]
     lng = params[:lng]
     @users = User.includes(:contact_info).within(0.01, :origin => [lat, lng]).where.not(id: current_user_id)
     #.order('distance DESC') Need to add column distance to do this
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new user_params
    #TODO create associations
    if @user && @user.save
      render :profile, status: 201
    else
      render json: { error: @user.errors }, status: 422
    end
  end

  def login
    @user = User.find_by email: user_params[:email]
    if @user && @user.authenticate(user_params[:password])
      render :login, status: 201
    else
      render json: { error: "incorrect email/password combination" }, status: 422
    end
  end

  def update
    @user = current_user
    if @user.update user_params
      render :profile, status: 200
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

    share = Share.new user_id: me.id, sent_to: user.id, info: {}

    if Share.where(sent_to: me.id).find_by(user_id: user.id)
      me.contact_list.list << user.id
      user.contact_list.list << me.id
      save_share(share) if me.contact_list.save && user.contact_list.save
    else
      save_share(share)
    end
  end

  def inbound
    inbound_shares = Share.where(sent_to: current_user.id)
    inbound_ids = inbound_shares.map { |share| share.user_id }
    @users = User.includes(:contact_info).where(id: inbound_ids)
    render :index
  end

  def outbound
    outbound_shares = Share.where(user_id: current_user.id)
    outbound_ids = outbound_shares.map { |share| share.sent_to }
    @users = User.includes(:contact_info).where(id: outbound_ids)
    render :index
  end

  private

    def save_share(share)
      if share.save
        render json: { success: "Win" }, status: 200
      else
        render json: { error: "You have failed to achieve victory" }, status: 422
      end
    end

    def current_user
      User.find params[:id]
    end

    def user_params
      params.require(:user).permit(:password, :password_confirmation, :email, :name)
    end

    def contact_params
      params.require(:contact_info).permit(:phone, :company, :facebook, :instagram, :github, :linkedin, :twitter, :site)
    end

end
