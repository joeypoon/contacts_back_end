module ApplicationHelper
  def current_user
    User.find params[:id]
  end
end
