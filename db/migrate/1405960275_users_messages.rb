class UsersMessages < ActiveRecord::Migration
  def up
    create_table :users_messeages do |t|
      t.string :name
      t.string :message
    end
  end


  def down
    drop_table :users
  end
end
