class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :tain_line
      t.time :start_time
      t.time :end_time
      t.boolean :sms
      t.boolean :email

      t.timestamps
    end
  end
end
