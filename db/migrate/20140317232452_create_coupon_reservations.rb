class CreateCouponReservations < ActiveRecord::Migration
  def change
    create_table :coupon_reservations do |t|
      t.integer :user_id
      t.integer :coupon_id
      t.string :checkup_code, null: false, limit: 4
      t.timestamps
    end
    add_index :coupon_reservations, :user_id
    add_index :coupon_reservations, :coupon_id
  end
end
