class RenameVideoToImageUrlRestaurantTable < ActiveRecord::Migration
  def change
  	rename_column :restaurants, :video_url, :image_url
  end
end
