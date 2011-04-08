class CreateTournaments < ActiveRecord::Migration
  def self.up
    create_table :tournaments do |t|
      t.string :name
      t.string :league
      t.datetime :start_dt
      t.datetime :end_dt

      t.timestamps
    end

    add_index :tournaments, [:name, :league], :unique => true
  end

  def self.down
    drop_table :tournaments
  end
end
