class Manage < ActiveRecord::Base
    mount_uploaders :pictures, PictureUploader
    validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
    validates :price, presence: true, length: { maximum: 10 }
    validates :ingredient, presence: true, length: { maximum: 200 }
    
    
end
