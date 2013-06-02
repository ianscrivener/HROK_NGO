class ChangeUriTypeColumn < ActiveRecord::Migration
  def up
    rename_column :uris, :type, :uri_type
  end

  def down
    rename_column :uris, :uri_type, :type
  end
end
