class List < ActiveRecord::Base
    has_many :manages
    belongs_to :orders
    
end
