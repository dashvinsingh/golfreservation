# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')


clubid = 1
Timeslot.create!(title:'9:00-9:20', golfclub_id:clubid)
Timeslot.create!(title:'9:20-9:40', golfclub_id:clubid)
Timeslot.create!(title:'9:40-10:00', golfclub_id:clubid)
Timeslot.create!(title:'10:00-10:20', golfclub_id:clubid)
Timeslot.create!(title:'10:20-10:40', golfclub_id:clubid)