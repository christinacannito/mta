json.array!(@recipients) do |recipient|
  json.extract! recipient, :id, :first_name, :last_name, :phone_number, :email_address, :email_template
  json.url recipient_url(recipient, format: :json)
end
