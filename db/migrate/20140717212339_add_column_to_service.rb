class AddColumnToService < ActiveRecord::Migration
  def change
    add_reference :services, :line, index: true
  end
end
