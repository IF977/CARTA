class AddColumnTimestampToOrderListDef < ActiveRecord::Migration
  def change
    add_column :order_list_defs, :created_at, :datetime
    add_column :order_list_defs, :updated_at, :datetime
  end
end
