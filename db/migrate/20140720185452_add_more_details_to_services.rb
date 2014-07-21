class AddMoreDetailsToServices < ActiveRecord::Migration
  def change
    add_column :services, :more_detail, :text
  end
end
