class AddListIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :list_id, :string
  end
end
