class Drink < ActiveRecord::Base
  has_many :consumptions
  has_many :drinks, through: :consumption
end
