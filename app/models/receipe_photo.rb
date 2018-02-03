class ReceipePhoto < ApplicationRecord
	mount_uploader :photo, AvatarUploader
	belongs_to :receipe
end
