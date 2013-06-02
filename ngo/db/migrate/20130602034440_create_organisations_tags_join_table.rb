class CreateOrganisationsTagsJoinTable < ActiveRecord::Migration
 def self.up
    create_table :organisations_tags, :id => false do |t|
      t.integer :organisation_id
      t.integer :tag_id
    end

    add_index :organisations_tags, [:organisation_id, :tag_id]
  end

  def self.down
    drop_table :organisations_tags
  end
end