json.array! @users do |user|
  json.name user.name
  json.company user.company
  json.id user.id
end
