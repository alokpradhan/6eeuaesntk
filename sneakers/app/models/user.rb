class User < ActiveRecord::Base

  has_many :shoes
  has_secure_password
  validates :username, length: { in: 6..20 }

end
