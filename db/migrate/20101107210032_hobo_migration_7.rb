class HoboMigration7 < ActiveRecord::Migration
  def self.up
    add_column :ratings, :user_id, :integer
    add_column :ratings, :video_id, :integer

    add_index :ratings, [:user_id]
    add_index :ratings, [:video_id]
  end

  def self.down
    remove_column :ratings, :user_id
    remove_column :ratings, :video_id

    remove_index :ratings, :name => :index_ratings_on_user_id rescue ActiveRecord::StatementInvalid
    remove_index :ratings, :name => :index_ratings_on_video_id rescue ActiveRecord::StatementInvalid
  end
end
