json.array!(@contacts) do |contact|
  json.extract! contact, :id, :first_name, :last_name, :email_addres, :phone, :address, :web_site
  json.url contact_url(contact, format: :json)
end
