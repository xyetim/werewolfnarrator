class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :role
      t.references :game
      t.string :response

      t.timestamps
    end
  end
end
