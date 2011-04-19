class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.integer :tournament_id
      t.string :name
      t.string :description
      t.boolean :private

      t.timestamps
    end

    add_index :groups, :tournament_id
  end

  def self.down
    drop_table :groups
  end
end
