class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      # TODO: look into using t.references
      t.integer :player_1_id, index: true
      t.integer :player_2_id, index: true
      t.integer :player_1_throw_id, index: true
      t.integer :player_2_throw_id, index: true
    end
  end
end
