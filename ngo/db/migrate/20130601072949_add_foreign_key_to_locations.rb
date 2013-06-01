class AddForeignKeyToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :organisation_id, :integer
  end
end
