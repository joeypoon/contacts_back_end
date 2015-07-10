class User < ActiveRecord::Base

  has_secure_password
  has_one :contact_info
  acts_as_mappable
  # geocoded_by :city
  # after_validation :geocode

end
