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
   if bac < 0.3
    "Drink up mate"
   elsif bac > 0.2 && bac < 0.5
    "You're getting there"
   elsif bac > 0.5 && bac < 0.9
    "Heals in the seeling"
   elsif bac > 0.9 && bac < 1
    "The first one to oblivian wins!!!"
   elsif bac >1 && bac < 2
    'Piss ass drunk'
   else  bac > 2 && bac > 2.5
    "You're just shit faced!"
  end
 end

 def self.drive(bac)
  if bac < 0.5
    "you can drive"
  else 
    "DO NOT DRIVE, YOU HAD ONE TO MANY"
  end
end

def self.calculate_calories(user)
    total_calories = user.drinks.map(&:calories).inject(:+)
end

# def show_name
#  @drinks.where(name:"beer")
# end
end


  
  
