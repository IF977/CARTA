class CreateDishOrdersJoinTable < ActiveRecord::Migration
  def change
    create_table :dishes_orders, id: false do |t|
      t.integer :dish_id
      t.integer :order_id
    end
  end
end
