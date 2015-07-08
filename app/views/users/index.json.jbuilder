json.array! @users do |user|
  json.name user.name
  json.company user.company
  json.id user.id
    json.current_position do
      json.lat user.current_position.lat
      json.long user.current_position.long
   end
end
