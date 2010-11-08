class HoboMigration4 < ActiveRecord::Migration
  def self.up
    add_column :viewings, :rating_id, :integer

    add_index :viewings, [:rating_id]
  end

  def self.down
    remove_column :viewings, :rating_id

    remove_index :viewings, :name => :index_viewings_on_rating_id rescue ActiveRecord::StatementInvalid
  end
end
