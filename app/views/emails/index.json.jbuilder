json.array!(@emails) do |email|
  json.extract! email, :id, :recipient_id, :title_of_the_message, :message_body, :sender_id
  json.url email_url(email, format: :json)
end
