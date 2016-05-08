class AddMyColumnToDish < ActiveRecord::Migration
  def change
    add_column :dishes, :image_file_name, :string
  end
end
