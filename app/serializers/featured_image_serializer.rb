class FeaturedImageSerializer

  def self.urls(images)
    {
      "data": {
        "urls": images.map do |image|
          image.url
        end
      }
    }
  end

end
