class FeaturedImageSerializer

  def self.index(images)
    {
      "data": {
        "featured_images": images.map do |image|
          {
            "id": image.id,
            "url": image.url
          }
        end
      }
    }
  end

end
