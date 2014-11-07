json.array!(@group_emails) do |group_email|
  json.extract! group_email, :id, :message_subject, :message_body
  json.url group_email_url(group_email, format: :json)
end
