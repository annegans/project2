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

u1 = User.create( weight: 65, height: 1.76, sex: true, name: 'ANNE', age: 24)

d1 = Drink.create( name: 'Beer', calories: 155, size: 23.5)
d2 = Drink.create( name: 'Wine', calories: 132, size: 23.5)
d3 = Drink.create( name: 'Spirit', calories: 123, size: 23.5)
d4 = Drink.create( name: 'Shot', calories: 97, size: 23.5)


c1 = Consumption.create(drink_id: d1.id)
c2 = Consumption.create(drink_id: d2.id)
c3 = Consumption.create(drink_id: d3.id)
c4 = Consumption.create(drink_id: d4.id)


# u1.consumptions << c1
# u1.consumptions << c2
# u1.consumptions << c3
# u1.consumptions << c4
