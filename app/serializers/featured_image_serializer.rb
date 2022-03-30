class FeaturedImageSerializer

  def self.index(image_urls)
    {
      "data": {
        "featured_images": image_urls
      }
    }
  end

end
