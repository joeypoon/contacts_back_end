class User < ActiveRecord::Base

  has_secure_password
  has_one :contact_info, dependent: :destroy
  acts_as_mappable

end
