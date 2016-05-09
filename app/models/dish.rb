class Dish < ActiveRecord::Base
    has_many :dish_attachments
    accepts_nested_attributes_for :dish_attachments
    mount_uploaders :images, ImageUploader
    has_and_belongs_to_many :orders
end
