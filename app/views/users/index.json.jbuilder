json.array! @users do |user|
  json.name user.name
  json.email user.email
  json.phone user.phone
  json.company user.company
  json.city user.city
  json.state user.state
  json.facebook user.facebook
  json.twitter user.twitter
  json.linkedin user.linkedin
  json.github user.github
  json.instagram user.instagram
  json.id user.id
end
