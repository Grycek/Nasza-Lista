class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.integer :user_id
      t.integer :edycja_id
      t.integer :czas
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :songs
  end
end
