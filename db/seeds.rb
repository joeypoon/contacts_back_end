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

paul = User.create! (name:"Paul Saad", email:"paulesaad@gmail.com", company:"React Natives", phone:"1234567890", site:"paulesaad.com", twitter:"@paulesaad", github:"/paulesaad", instagram:"@paulesaad", facebook:"/paulesaad", linkedin:"paul saad", skype:"paulesaad", password:"password", password_confirmation:"password", avatar:"https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAAIxAAAAJGQyMGZmNWE0LWExYmMtNDQ3OS04YTViLWEyNmY2ZWFlZjliNw.jpg")

joey = User.create! (name:"Joey Poon", email:"joeypoon@gmail.com", company:"Erdos Miller", phone:"1234567890", site:"joeypoon.com", twitter:"@joeypoon", github:"/joeypoon", instagram:"@joeypoon", facebook:"/joeypoon", linkedin:"joey poon", skype:"joeypoon", password:"password", password_confirmation:"password", avatar:"https://avatars2.githubusercontent.com/u/11009772?v=3&s=460")

martin = User.create! (name:"Martin Bee", email:"martbee@gmail.com", company:"The Iron Yard", phone:"1234567890", site:"martbee.com", twitter:"@martbee", github:"/martbee", instagram:"@martbee", facebook:"/martbee", linkedin:"paul saad", skype:"martbee", password:"password", password_confirmation:"password", avatar:"https://avatars2.githubusercontent.com/u/9852415?v=3&s=460")
