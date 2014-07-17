json.array!(@first_names) do |first_name|
  json.extract! first_name, :id, :last_name, :phone_number, :email_address, :email_template
  json.url first_name_url(first_name, format: :json)
end
