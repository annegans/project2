class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :weight
      t.float :height
      t.boolean :sex
      t.string :name
      t.integer :age

      t.timestamps null: false
    end
  end
end
