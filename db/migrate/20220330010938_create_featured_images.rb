class CreateFeaturedImages < ActiveRecord::Migration[5.2]
  def change
    create_table :featured_images do |t|
      t.string :url

      t.timestamps
    end
  end
end
