class CreateTagThings < ActiveRecord::Migration
  def change
    create_table :tag_things do |t|
      t.belongs_to :tag
      t.belongs_to :thing
      t.timestamps
    end
  end
end
