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
    @user.create_contact_info contact_params
    @user.contact_info.user_id = @user.id 

    if @user.save
      render :show, status: 201
    else
      render json: { error: @user.errors }, status: 422
    end
  end

  def login
    contact = ContactInfo.find_by email: user_params[:email]
    @user = User.find (contact.id)
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
      params.require(:user).permit(:password, :password_confirmation, :email)
    end

    def contact_params
      params.require(:contact_info).permit(:name, :email, :phone, :company, :facebook, :instagram, :github, :linkedin, :twitter, :site)
    end

end
