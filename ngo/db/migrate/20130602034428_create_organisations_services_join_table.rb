class CreateOrganisationsServicesJoinTable < ActiveRecord::Migration
 def self.up
    create_table :organisations_services, :id => false do |t|
      t.integer :organisation_id
      t.integer :service_id
    end

    add_index :organisations_services, [:organisation_id, :service_id]
  end

  def self.down
    drop_table :organisations_services
  end
end
