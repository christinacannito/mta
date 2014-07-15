json.array!(@my_settings) do |my_setting|
  json.extract! my_setting, :id, :first_name, :last_name, :phone_number, :email_address, :email_template
  json.url my_setting_url(my_setting, format: :json)
end
