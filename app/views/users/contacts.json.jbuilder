json.array! @users do |user|
  json.id user.id
  json.avatar user.avatar.url
  json.name user.name
  json.company user.company
end
