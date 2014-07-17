json.array!(@users) do |user|
  json.extract! user, :id, :email_string, :password_hash
  json.url user_url(user, format: :json)
end
