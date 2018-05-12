class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :num_players
      t.integer :current_phase, default: 0
      t.text :roles
      t.text :night_targets
      t.boolean :in_phase_transition
      t.integer :night_count, default: 0
      t.integer :music_pid

      t.timestamps
    end
  end
end
