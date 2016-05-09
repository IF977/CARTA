class AddImagesToDishAttachment < ActiveRecord::Migration
  def change
    add_column :dish_attachments, :images, :json
  end
end
