class CreateMesasTemps < ActiveRecord::Migration
  def change
    create_table :mesas_temps do |t|
      t.string :mesa

      t.timestamps null: false
    end
  end
end
