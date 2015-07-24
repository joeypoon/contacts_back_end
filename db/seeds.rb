# 10.times do
#
#   lat = [-58.000001, -58.000002, -58.000003, -58.000004, 100.0000000 ].sample
#   lng = [-68.000001, -68.000002, -68.000003, -68.000004, 100.0000000].sample
#
#   user = User.create! name: Faker::Name.name,
#                       email: Faker::Internet.email,
#                       phone: Faker::PhoneNumber.cell_phone,
#                       company: Faker::Company.name,
#                       site: "http://#{Faker::Name.name.parameterize}.com",
#                       twitter: Faker::Internet.url("twitter.com/#{Faker::Name.name.parameterize}"),
#                       github: Faker::Internet.url("github.com/#{Faker::Name.name.parameterize}"),
#                       facebook: Faker::Internet.url("facebook.com/#{Faker::Name.name.parameterize}"),
#                       instagram: Faker::Internet.url("instagram.com/#{Faker::Name.name.parameterize}"),
#                       linkedin: Faker::Internet.url("linkedin.com/#{Faker::Name.name.parameterize}"),
#                       skype: Faker::Internet.email,
#                       password: 'password',
#                       password_confirmation: 'password',
#                       lat: lat,
#                       lng: lng
#
#   ContactList.create! user_id: user.id
#
# end
