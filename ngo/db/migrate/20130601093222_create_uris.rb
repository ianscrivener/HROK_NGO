class CreateUris < ActiveRecord::Migration
  def change
    create_table :uris do |t|
      t.string :type
      t.string :url
      t.string :type_other
      t.references :organisation
    
      t.timestamps
    end
  end
end
