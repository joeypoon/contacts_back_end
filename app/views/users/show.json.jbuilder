json.user do
  json.id @user.id
  json.avatar @user.avatar.url
  json.name @user.name
  json.company @user.company
  json.email @user.email
  json.phone @user.phone if @share.info["phone"]
  json.facebook @user.facebook if @share.info["facebook"]
  json.instagram @user.instagram if @share.info["instagram"]
  json.github @user.github if @share.info["github"]
  json.linkedin @user.linkedin if @share.info["linkedin"]
  json.twitter @user.twitter if @share.info["twitter"]
  json.site @user.site if @share.info["site"]
end
