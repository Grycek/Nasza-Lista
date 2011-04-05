class CreateEliminations < ActiveRecord::Migration
  def self.up
    create_table :eliminations do |t|
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :eliminations
  end
end
