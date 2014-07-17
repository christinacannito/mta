class CreateFirstNames < ActiveRecord::Migration
  def change
    create_table :first_names do |t|
      t.string :last_name
      t.integer :phone_number
      t.string :email_address
      t.text :email_template

      t.timestamps
    end
  end
end
