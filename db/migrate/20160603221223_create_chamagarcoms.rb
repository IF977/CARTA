class CreateChamagarcoms < ActiveRecord::Migration
  def change
    create_table :chamagarcoms do |t|
      t.string  :mesa_num
      t.integer :cod_chamado
      t.string  :status

      t.timestamps null: false
    end
  end
end
