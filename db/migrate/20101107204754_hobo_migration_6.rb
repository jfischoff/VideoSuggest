class HoboMigration6 < ActiveRecord::Migration
  def self.up
    add_column :suggested_videos, :user_id, :integer
    add_column :suggested_videos, :expected_prob_id, :integer

    add_column :expected_probs, :user_id, :integer
    add_column :expected_probs, :video_id, :integer

    add_index :suggested_videos, [:user_id]
    add_index :suggested_videos, [:expected_prob_id]

    add_index :expected_probs, [:user_id]
    add_index :expected_probs, [:video_id]
  end

  def self.down
    remove_column :suggested_videos, :user_id
    remove_column :suggested_videos, :expected_prob_id

    remove_column :expected_probs, :user_id
    remove_column :expected_probs, :video_id

    remove_index :suggested_videos, :name => :index_suggested_videos_on_user_id rescue ActiveRecord::StatementInvalid
    remove_index :suggested_videos, :name => :index_suggested_videos_on_expected_prob_id rescue ActiveRecord::StatementInvalid

    remove_index :expected_probs, :name => :index_expected_probs_on_user_id rescue ActiveRecord::StatementInvalid
    remove_index :expected_probs, :name => :index_expected_probs_on_video_id rescue ActiveRecord::StatementInvalid
  end
end
