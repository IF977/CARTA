class CreateDishAttachments < ActiveRecord::Migration
  def change
    create_table :dish_attachments do |t|
      t.integer :dish_id
      t.string :image

      t.timestamps null: false
    end
  end
end
