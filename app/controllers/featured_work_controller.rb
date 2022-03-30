class FeaturedWorkController < ApplicationController

  def index # Returns an array of ALL featured image urls
    if valid_api_key?(params[:api_key])
      featured_images = FeaturedImage.all
      render json: FeaturedImageSerializer.index(featured_images)
    else
      render json: ErrorSerializer.main(["api_key param is either missing or invalid"]), status: 401
    end
  end

  def update # Destroys all featured images, then updates them
    if valid_api_key?(params[:api_key])
      FeaturedImage.destroy_all

      params[:urls] ||= []
      params[:urls].each do |url|
        FeaturedImage.create(url: url)
      end

      featured_images = FeaturedImage.all
      render json: FeaturedImageSerializer.index(featured_images)
    else
      render json: ErrorSerializer.main(["api_key param is either missing or invalid"]), status: 401
    end
  end

end
