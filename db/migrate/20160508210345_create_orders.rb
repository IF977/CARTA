class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :n_order
      t.string :price
      t.string :n_table
      t.references :manage, index: true
      
      t.timestamps null: false
    end
  end
end
