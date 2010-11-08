class HoboMigration3 < ActiveRecord::Migration
  def self.up
    add_column :viewings, :user_id, :integer

    add_index :viewings, [:user_id]
  end

  def self.down
    remove_column :viewings, :user_id

    remove_index :viewings, :name => :index_viewings_on_user_id rescue ActiveRecord::StatementInvalid
  end
end
