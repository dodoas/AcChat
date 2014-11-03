json.array!(@emails) do |email|
  json.extract! email, :id, :recipient_id, :message_subject, :message_body
  json.url email_url(email, format: :json)
end
