class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :description, null: false
      t.string :coupon_image
      t.integer :number_of_available, null: false
      t.integer :restaurant_id
      t.timestamps
    end
    add_index :coupons, :restaurant_id
  end
end
