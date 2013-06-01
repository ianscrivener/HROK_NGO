class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address_name
      t.string :address1
      t.string :address2
      t.string :state
      t.string :suburb
      t.string :country
      t.string :country_code
      t.string :postcode
      t.string :is_main
      t.string :geo_admin_0
      t.string :geo_admin_1
      t.string :geo_admin_2
      t.string :geo_admin_3
      t.string :geo_admin_4
      t.string :geo_dlat
      t.string :geo_dlong
      t.string :geo_geocode_modified
      t.string :geo_geocode_reqd

      t.timestamps
    end
  end
end
