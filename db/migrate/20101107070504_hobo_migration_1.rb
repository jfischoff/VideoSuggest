class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string   :url
      t.string   :title
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :videos
  end
end
