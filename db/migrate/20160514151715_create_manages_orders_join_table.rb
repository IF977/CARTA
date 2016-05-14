class CreateManagesOrdersJoinTable < ActiveRecord::Migration
  def change
    create_table :manages_orders, id: false do |t|
      t.integer :manage_id
      t.integer :order_id
      
    end
  end
end
