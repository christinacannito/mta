class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.datetime :start
      t.datetime :end
      t.references :user_id, index: true
      t.references :line_id, index: true
      t.references :recipient_id, index: true
      t.text :sms
      t.text :email

      t.timestamps
    end
  end
end
