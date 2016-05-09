class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :price
      t.string :ingredients
      t.string :description
      t.string :name_image

      t.timestamps null: false
    end
  end
end
