# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: 'zoe.goldfarb+test@gmail.com', password: 'password', password_confirmation: 'password')

Contact.create([
  {name: "Bob", email: "zoe.goldfarb+bob@gmail.com", phone: '5551234', photo: 'http://i.imgur.com/RkBOmq2.jpg', user_id: user.id},
  {name: "Sally", email: "zoe.goldfarb+sally@gmail.com", phone: '5551235', photo: 'http://i.imgur.com/1v2oxMc.jpg', user_id: user.id},
  {name: "Mike", email: "zoe.goldfarb+mike@gmail.com", phone: '5551236', photo: 'http://i.imgur.com/pQW7tdk.jpg', user_id: user.id}
  ])
