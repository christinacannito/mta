class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :traffic
      t.string :description

      t.timestamps
    end
  end
end
