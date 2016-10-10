# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Motor.create(name: 'Honda Supra X', velocity: 5, current_fuel: 0, max_fuel: 10, distance_travelled: 0, time_travelled: 0)
Motor.create(name: 'Honda Scoopy', velocity: 4, current_fuel: 2, max_fuel: 8, distance_travelled: 0, time_travelled: 0)
Motor.create(name: 'Honda CBR 250', velocity: 15, current_fuel: 0, max_fuel: 20, distance_travelled: 0, time_travelled: 0)
Motor.create(name: 'Honda CBR 500', velocity: 25, current_fuel: 0, max_fuel: 30, distance_travelled: 0, time_travelled: 0)

Person.create(name: 'Riady', money: 99999999)
Person.create(name: 'Willy', money: 99999999)
Person.create(name: 'Kenzo', money: 99999999)
Person.create(name: 'Depi', money: 99999999)