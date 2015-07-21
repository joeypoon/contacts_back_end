class UsersController < ApplicationController

  def index
     current_user = User.find params[:id]
     lat = params[:lat]
     lng = params[:lng]
     current_user.lat = lat
     current_user.lng = lng
     contact_ids = current_user.contact_list.list
     outbound_ids = current_user.shares
     all_ids = contact_ids << current_user.id
     if current_user.save
       @users = User.within(0.01, :origin => [lat, lng]).where.not(id: all_ids)
     end
     #.order('distance DESC') Need to add column distance to do this
  end

  def create
    @user = User.new user_params
    @user.create_contact_list
    if @user && @user.save
      render :edit, status: 201
    else
      render json: { error: @user.errors }, status: 422
    end
  end

  def login
    @user = User.find_by email: user_params[:email]
    if @user && @user.authenticate(user_params[:password])
      render :edit, status: 200
    else
      render json: { error: "incorrect email/password combination" }, status: 422
    end
  end


  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update user_params
      render :edit, status: 200
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
    share = Share.new user_id: me.id, sent_to: user.id, info: share_params
    inbound_share = Share.where(sent_to: me.id).find_by(user_id: user.id)
    if inbound_share
      me.contact_list.list << user.id
      user.contact_list.list << me.id
      share.shared = true
      inbound_share.shared = true
      save_shares(share, inbound_share) if me.contact_list.save && user.contact_list.save
      binding.pry
    else
      save_share(share)
    end
  end

  def destroy_inbound
    share = Share.where(sent_to: params[:id]).find_by(user_id: params[:user_id])
    share.destroy
  end

  def destroy_outbound
    share = Share.where(sent_to: params[:user_id]).find_by(user_id: params[:id])
    share.destroy
  end

  def destroy_contact
    current_user.contact_list.list.delete(params[:user_id])
  end

  def inbound
    inbound_shares = Share.where(sent_to: current_user.id).not_shared #showing all
    inbound_ids = inbound_shares.map { |share| share.user_id }
    @users = User.where(id: inbound_ids)
    render :index
  end

  def outbound
    outbound_shares = Share.where(user_id: current_user.id).not_shared #showing all
    outbound_ids = outbound_shares.map { |share| share.sent_to }
    @users = User.where(id: outbound_ids)
    render :index
  end

  def contact_list
    contact_ids = current_user.contact_list.list
    @users = User.where(id: contact_ids)
    render :contacts
  end

  def show
    @user = User.find_by id: params[:user_id]
    me = current_user
    @share = Share.where(sent_to: me.id).find_by(user_id: @user.id)
  end

  private

    def save_shares(s1, s2)
      if s1.save && s2.save
        render json: { success: "Win" }, status: 200
      else
        render json: { error: "You have failed to achieve victory" }, status: 422
      end
    end

    def save_share(share)
      if share.save
        render json: { success: "Win" }, status: 200
      else
        render json: { error: "You have failed to achieve victory" }, status: 422
      end
    end

    def user_params
      params.require(:user).permit(:password, :password_confirmation, :email, :name, :avatar, :phone, :company, :facebook, :instagram, :github, :linkedin, :twitter, :site)
    end

    def share_params
      params.require(:share).permit(:email, :phone, :facebook, :instagram, :github, :linkedin, :twitter, :site)
    end
end
