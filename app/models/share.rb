class Share < ActiveRecord::Base
  belongs_to :user

  scope :from_current_user, where(user_id: current_user.id)
  scope :sent_to_current_user, where(sent_to: current_user.id)
  scope :not_shared, where(shared: false)
end
