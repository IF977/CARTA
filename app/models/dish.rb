class Dish < ActiveRecord::Base
has_many :dish_attachments
   accepts_nested_attributes_for :dish_attachments

end
