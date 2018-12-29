class CreatePlayerGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :player_groups do |t|
      t.references :games
      t.string :public_id
      t.timestamps
    end
  end
end
