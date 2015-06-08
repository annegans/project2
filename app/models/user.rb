class User < ActiveRecord::Base
  has_many :consumptions
  has_many :drinks, through: :consumptions

end
