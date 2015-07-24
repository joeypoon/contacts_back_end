json.array! @users do |user|
  json.id user.id
  json.name user.name
  json.email user.email
  json.phone user.phone
  json.company user.company
  json.facebook user.facebook
  json.instagram user.instagram
  json.github user.github
  json.linkedin user.linkedin
  json.twitter user.twitter
  json.skype user.skype
  json.site user.site
  json.avatar user.avatar.url
end
