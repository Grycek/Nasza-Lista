class CreateEliminationVotes < ActiveRecord::Migration
  def self.up
    create_table :elimination_votes do |t|
      t.integer :song_id
      t.integer :user_id
      t.integer :points

      t.timestamps
    end
  end

  def self.down
    drop_table :elimination_votes
  end
end
