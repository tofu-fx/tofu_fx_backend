class DropFeaturedImages < ActiveRecord::Migration[5.2]
  def change
    drop_table :featured_images
  end
end
