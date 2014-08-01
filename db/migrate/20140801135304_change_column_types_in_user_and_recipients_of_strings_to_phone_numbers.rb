class ChangeColumnTypesInUserAndRecipientsOfStringsToPhoneNumbers < ActiveRecord::Migration
  def change
  	change_column :users, :phone_number, :integer
  	change_column :recipients, :phone_number, :integer
  end
end
