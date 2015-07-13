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
    if @user && @user.save
      render :profile, status: 201
    else
      render json: { error: @user.errors }, status: 422
    end
  end

  def login
    @user = User.find_by email: user_params[:email]
    if @user && @user.authenticate(user_params[:password])
      render :show
    else
      render json: { error: "incorrect email/password combination" }, status: 422
    end
  end

  def update
    @user = current_user
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

    me.outbound_shares << { user: { id: user.id, email: user.contact_info.email } }
    user.inbound_shares << { user: { id: me.id, email: me.contact_info.email } }

    inbound_ids = me.inbound_shares.map { |user| user["user"]["id"] }

    if inbound_ids.include? user.id
      add_to_contact_list(me, user)
    end

    if me.save && user.save
      render json: { success: "You win at life" }, status: 200
    else
      render json: { error: "Failed to achieve victory, please try again" }, status: 422
    end
  end

  def inbound
    inbound_ids = current_user.inbound_shares.map { |share| share["user"]["id"] }
    @users = User.includes(:contact_info).where(id: inbound_ids)
    render :index
  end

  def outbound
    outbound_ids = current_user.outbound_shares.map { |share| share["user"]["id"] }
    @users = User.includes(:contact_info).where(id: outbound_ids)
    render :index
  end

  private

    def add_to_contact_list(user1, user2)
      #check if already shared
      user1.contact_list << user2.id
      user1.inbound_shares.delete!(user2.id)
      user1.outbound_shares.delete!(user2.id)
      user2.contact_list << user1.id
      user2.inbound_shares.delete!(user1.id)
      user2.outbound_shares.delete!(user1.id)
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
