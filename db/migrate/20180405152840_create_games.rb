class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :num_players
      t.integer :current_phase, default: 0
      t.text :roles

      t.timestamps
    end
  end
end
