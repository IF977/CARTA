class CreateManages < ActiveRecord::Migration
  def change
    create_table :manages do |t|
      t.string :name
      t.string :price
      t.string :ingredient
      t.column :pictures , :json

      t.timestamps null: false
    end
  end
end
