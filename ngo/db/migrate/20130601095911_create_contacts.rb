class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :position
      t.string :phone
      t.string :mobile
      t.string :email
      t.string :skype
      t.string :linkedin
      t.string :in_main
      t.references :organisation
      
      t.timestamps
    end
  end
end
