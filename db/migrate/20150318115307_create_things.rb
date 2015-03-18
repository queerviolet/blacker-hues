class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :title
      t.belongs_to :category, index: true
      t.string :description
      t.string :edit_token

      t.timestamps
    end
  end
end

