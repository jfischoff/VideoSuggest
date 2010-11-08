class HoboMigration14 < ActiveRecord::Migration
  def self.up
    create_table :unwatched_videos do |t|
      t.datetime :created_at
      t.datetime :updated_at
    end

    remove_index :viewings, :name => :index_viewings_on_rating_id rescue ActiveRecord::StatementInvalid
  end

  def self.down
    drop_table :unwatched_videos

    add_index :viewings, [:rating_id]
  end
end
