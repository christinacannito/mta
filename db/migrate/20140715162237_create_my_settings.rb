class CreateMySettings < ActiveRecord::Migration
  def change
    create_table :my_settings do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_number
      t.string :email_address
      t.text :email_template

      t.timestamps
    end
  end
end
###