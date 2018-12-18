class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :role
      t.references :game
      t.string :response
      t.boolean :alive, default: true
      t.boolean :mayor, default: false

      t.timestamps
    end
  end
end
