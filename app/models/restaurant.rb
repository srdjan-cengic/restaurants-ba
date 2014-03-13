class Restaurant < ActiveRecord::Base
	validates :name, :description, :telephone, :presence => true
	validates :name, :telephone, :fb_page, :video_url, uniqueness: true
	validates :name, length: { maximum: 60 }
	validates :telephone, length: { maximum: 15 }
end
