class HoboMigration5 < ActiveRecord::Migration
  def self.up
    add_column :viewings, :video_id, :integer

    add_index :viewings, [:video_id]
  end

  def self.down
    remove_column :viewings, :video_id

    remove_index :viewings, :name => :index_viewings_on_video_id rescue ActiveRecord::StatementInvalid
  end
end
