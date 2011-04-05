class RenameUserIdToSongId < ActiveRecord::Migration
  def self.up
    change_table :elimination_votes do |t|
      t.rename :user_id, :song_id
    end
  end

  def self.down
    change_table :elimination_votes do |t|
      t.rename :song_id, :user_id
    end
  end
end
