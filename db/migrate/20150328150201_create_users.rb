class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :nick  # Nickname, short form of name, user-chosen
      t.string :password_digest
      t.timestamps
    end
  end
end
