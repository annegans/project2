class User < ActiveRecord::Base
  has_many :consumptions
  has_many :drinks, through: :consumptions

  # has_secure_password
  # validates :password, presence: true, on: :create
  # validates :email, presence: true
  # validates :email, uniqueness: { case_sensitive: false }

end
