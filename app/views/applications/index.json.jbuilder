json.array!(@applications) do |application|
  json.extract! application, :id, :public_name, :public_key, :private_name, :private_key
  json.url application_url(application, format: :json)
end
