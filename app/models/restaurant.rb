class Restaurant < ActiveRecord::Base
	has_many :favourites
	#By default, the validations run for both create and update. So it should be just:
	validates :name, :description, :telephone, :presence => true
	#validates :name, :telephone, :fb_page, :video_url, uniqueness: true
	validates :name, length: { maximum: 60 }
	validates :telephone, length: { maximum: 15 }
end
