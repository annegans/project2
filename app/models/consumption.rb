class Consumption < ActiveRecord::Base
  belongs_to :user
  belongs_to :drink 

 def self.calculate_bag(user)
    num_of_units = user.drinks.count
    weight = user.weight
    if user.sex == true
        sex = 0.61
      else 
        sex = 0.72
      end
    time = ((Time.now - user.drinks.first.created_at) / 60) / 60
    bac = (num_of_units * 10) / (weight * sex) - (time - 0.5) * (weight * 0.002)
    if bac < 0 
       bac = 0
    end 

    return bac
 end

def self.calcutate_calories(user)
    total_calories = user.drinks.map(&:calories).inject(:+)
end



end


  
  
