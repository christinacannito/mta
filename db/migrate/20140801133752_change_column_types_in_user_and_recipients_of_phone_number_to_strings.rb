class ChangeColumnTypesInUserAndRecipientsOfPhoneNumberToStrings < ActiveRecord::Migration
  def change
  	change_column :users, :phone_number, :string
  	change_column :recipients, :phone_number, :string
  end
end
