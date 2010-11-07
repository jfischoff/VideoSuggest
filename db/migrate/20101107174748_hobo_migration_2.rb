class HoboMigration2 < ActiveRecord::Migration
  def self.up
    create_table :suggested_videos do |t|
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :viewings do |t|
      t.datetime :view_date
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :expected_probs do |t|
      t.float    :prob
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :ratings do |t|
      t.string   :likiness
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :suggested_videos
    drop_table :viewings
    drop_table :expected_probs
    drop_table :ratings
  end
end
