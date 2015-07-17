class Share < ActiveRecord::Base
  belongs_to :user
  scope :not_shared, lambda { where(shared: false) }
end
