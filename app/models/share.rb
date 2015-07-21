class Share < ActiveRecord::Base
  belongs_to :user
  scope :not_shared, -> { where(shared: false) }
end
