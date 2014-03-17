class RestaurantSerializer < ActiveModel::Serializer
  attributes :name, :description, :telephone, :fb_page, :video_url
end