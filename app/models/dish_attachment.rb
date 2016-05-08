class DishAttachment < ActiveRecord::Base
  mount_uploader :images, ImageUploader
   belongs_to :dish
   
   
   
end
