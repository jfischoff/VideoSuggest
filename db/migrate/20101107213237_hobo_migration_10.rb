class HoboMigration10 < ActiveRecord::Migration
  def self.up
    remove_index :viewings, :name => :index_viewings_on_rating_id rescue ActiveRecord::StatementInvalid
  end

  def self.down
    add_index :viewings, [:rating_id]
  end
end
