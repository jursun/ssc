class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.integer :user_id
      t.integer :group_id
      t.boolean :admin
      t.string :status

      t.timestamps
    end

    add_index :teams, [:user_id, :group_id], :unique => true
  end

  def self.down
    drop_table :teams
  end
end
