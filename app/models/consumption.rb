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

 def self.drunk_level(bac) 
   if bac < 0.2
    "drink up mate"
   elsif bac > 02 && bac < 0.5
    "you're getting there"
   elsif bac > 05 && bac < 0.9
    "heals in the seeling"
   elsif bac > 0.9 && bac < 1
    "the first one to oblivian wins!!!"
   else  bac > 1 && bac > 1.5
    "you're just shit faced"
  end
 end

 def self.drive(bac)
  if bac < 0.5
    "you can drive"
  else 
    "do not drive"
  end
end

def self.calculate_calories(user)
    total_calories = user.drinks.map(&:calories).inject(:+)
end



end


  
  
