class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.string :kolona1
      t.integer :kolona2

      t.timestamps
    end
  end
end
