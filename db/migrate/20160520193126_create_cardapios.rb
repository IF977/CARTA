class CreateCardapios < ActiveRecord::Migration
  def change
    create_table :cardapios do |t|
      t.string :namep
      t.integer :qtd
      t.string :price
      t.string :total
      t.integer :manage_id
      t.string :mesa_n

      t.timestamps null: false
    end
  end
end
