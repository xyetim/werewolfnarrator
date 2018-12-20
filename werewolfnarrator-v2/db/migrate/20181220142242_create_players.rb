class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.references :game
      t.string :name
      t.timestamps
    end
  end
end
