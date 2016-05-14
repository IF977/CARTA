class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :namep
      t.integer :qtd
      t.string :price
      t.string :total

      t.timestamps null: false
    end
  end
end
