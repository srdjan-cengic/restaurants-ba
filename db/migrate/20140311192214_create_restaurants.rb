class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false, limit: 60
      t.text :description, null: false
      t.string :telephone, null: false, limit: 15
      t.string :fb_page
      t.string :video_url
      t.timestamps
    end
  end
end
