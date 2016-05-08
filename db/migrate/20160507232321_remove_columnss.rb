class RemoveColumnss < ActiveRecord::Migration
  def change
    remove_column :dishes, :image_file_name
  end
end
