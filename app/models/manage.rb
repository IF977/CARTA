class Manage < ActiveRecord::Base
    mount_uploaders :pictures, PictureUploader
    
end
