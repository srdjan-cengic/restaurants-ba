class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :count, default: 0
      t.integer :restaurant_id
      t.integer :user_id
      t.timestamps
    end
  end
end
