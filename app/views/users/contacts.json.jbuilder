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
  json.site user.site
end
