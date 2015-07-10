json.array! @users do |user|
  json.id user.id
  json.contact_info user.contact_info
end
