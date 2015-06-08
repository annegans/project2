# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Consumption.delete_all
Drink.delete_all

u1 = User.create( weight: 65, height: 1.76, sex: true, name: 'anne', age: 24)

d1 = Drink.create( name: 'beer', calories: 123, size: 23.5)
d2 = Drink.create( name: 'wine', calories: 10, size: 23.5)
d3 = Drink.create( name: 'strong alcohol', calories: 123, size: 23.5)
d4 = Drink.create( name: 'shot', calories: 143, size: 23.5)


c1 = Consumption.create(drink_id: d1.id)
c2 = Consumption.create(drink_id: d2.id)
c3 = Consumption.create(drink_id: d3.id)
c4 = Consumption.create(drink_id: d4.id)


u1.consumptions << c1
u1.consumptions << c2
u1.consumptions << c3
u1.consumptions << c4
