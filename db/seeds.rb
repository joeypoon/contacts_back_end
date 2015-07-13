10.times do

  lat = [-58.000001, -58.000002, -58.000003, -58.000004, 100.0000000 ].sample
  lng = [-68.000001, -68.000002, -68.000003, -68.000004, 100.0000000].sample

  user = User.create! password: 'password', password_confirmation: 'password', email: Faker::Internet.email, name: Faker::Name.name, lat: lat, lng: lng
  ContactInfo.create! user_id: user.id

end
