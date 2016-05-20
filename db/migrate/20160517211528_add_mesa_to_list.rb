class AddMesaToList < ActiveRecord::Migration
  def change
    add_column :lists, :mesa_n, :string
  end
end
