10.times do

  lat = [-58.000001, -58.000002, -58.000003, -58.000004, 100.0000000 ].sample
  long = [-68.000001, -68.000002, -68.000003, -68.000004, 100.0000000].sample

  User.create! name: Faker::Name.name, email: Faker::Internet.email, password: 'password', password_confirmation: 'password', phone: Faker::PhoneNumber.cell_phone, company: Faker::Company.name, city: Faker::Address.city, state: Faker::Address.state, facebook: 'www.facebook.com', twitter: 'www.twitter.com', linkedin: 'www.linkedin.com', github: 'www.github.com', instagram: 'www.instagram.com',
  latitude: lat, longitude: long

end
