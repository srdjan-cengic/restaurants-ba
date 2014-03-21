class RestaurantSerializer < ActiveModel::Serializer
  attributes :name, :description, :telephone, :fb_page, :image_url
end