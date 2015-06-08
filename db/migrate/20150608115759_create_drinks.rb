class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.float :calories
      t.float :units
      t.float :size
      t.text :ingredients

      t.timestamps null: false
    end
  end
end
