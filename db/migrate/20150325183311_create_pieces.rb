class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :name
    end
  end
end
