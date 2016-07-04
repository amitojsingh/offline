class Book < ActiveRecord::Base
mount_uploader :cover , ImageUploader
end
