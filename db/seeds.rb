10.times do

  lat = [-58.000001, -58.000002, -58.000003, -58.000004, 100.0000000 ].sample
  long = [-68.000001, -68.000002, -68.000003, -68.000004, 100.0000000].sample

  user = User.create! password: 'password', password_confirmation: 'password', latitude: lat, longitude: long
  ContactInfo.create! name: Faker::Name.name, email: Faker::Internet.email, user_id: user.id

end
