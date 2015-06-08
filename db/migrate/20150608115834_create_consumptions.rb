class CreateConsumptions < ActiveRecord::Migration
  def change
    create_table :consumptions do |t|
      t.integer :drink_id
      t.integer :user_id
      t.float :bag

      t.timestamps null: false
    end
  end
end
