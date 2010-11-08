class HoboMigration9 < ActiveRecord::Migration
  def self.up
    add_column :viewings, :rating, :string

    remove_index :viewings, :name => :index_viewings_on_rating_id rescue ActiveRecord::StatementInvalid
  end

  def self.down
    remove_column :viewings, :rating

    add_index :viewings, [:rating_id]
  end
end
