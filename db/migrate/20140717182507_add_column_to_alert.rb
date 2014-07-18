class AddColumnToAlert < ActiveRecord::Migration
  def change
    add_column :alerts, :last_sent, :datetime
  end
end
