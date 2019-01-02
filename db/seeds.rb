# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users_list = [
    {
      name: 'manish',
      email:'atri.manish.iiita@gmail.com',
      phone:'8884877977'
    },
    {
      name: 'pradeep',
      email:'pradeep@gmail.com',
      phone:'94850134419'
    },
    {
      name: 'arunava',
      email:'bhattacharjee.arunava9@gmail.com',
      phone:'94850134419'
    }
]
users = User.create(users_list)

users.each_with_index do |user, index|
  puts "creating user::::#{index}"
  5.times do
    user_contact = UserContact.create({user_id: user.id, name: "rahul#{index}", email:"", phone: "8884877977"})
    10.times do
      rand_days = rand(2..6)
      UserContactCallHistory.create({ user_id: user.id, user_contact_id: user_contact.id, start_time: (Time.zone.now - rand_days.days), end_time: (Time.zone.now - rand_days.days) + rand(10..5000) })
    end
  end
end
