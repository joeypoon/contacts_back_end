10.times do
  User.create! name: Faker::Name.name, email: Faker::Internet.email, password: 'password', password_confirmation: 'password', phone: Faker::PhoneNumber.cell_phone, company: Faker::Company.name, city: Faker::Address.city, state: Faker::Address.state, facebook: 'www.facebook.com', twitter: 'www.twitter.com', linkedin: 'www.linkedin.com', github: 'www.github.com', instagram: 'www.instagram.com'
end
