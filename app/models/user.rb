class User < ActiveRecord::Base

  has_secure_password
  has_one :contact_info

  # geocoded_by :city
  # after_validation :geocode

end
