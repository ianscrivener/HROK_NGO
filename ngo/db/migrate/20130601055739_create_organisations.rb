class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :name_display
      t.string :name_short
      t.string :name_full
      t.string :main_email
      t.string :main_phone
      t.string :main_fax
      t.string :main_url
      t.string :ngo_short_description, :limit => 125
      t.string :ngo_long_description, :limit => 1000

      t.timestamps
    end
  end
end
