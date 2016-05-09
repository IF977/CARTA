class RemoveColumns < ActiveRecord::Migration
  def change
    remove_column :dishes, :description
  end
end
