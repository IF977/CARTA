class AddManageIdToLists < ActiveRecord::Migration
  def change
    add_column :lists, :manage_id, :integer
  end
end
