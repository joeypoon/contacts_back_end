class User < ActiveRecord::Base

  has_secure_password

  has_one :contact_info, dependent: :destroy
  has_one :contact_list, dependent: :destroy
  has_many :shares, dependent: :destroy

  acts_as_mappable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: true

end
