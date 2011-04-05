class CreateEliminationResults < ActiveRecord::Migration
  def self.up
    create_table :elimination_results do |t|
      t.integer :song_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :elimination_results
  end
end
