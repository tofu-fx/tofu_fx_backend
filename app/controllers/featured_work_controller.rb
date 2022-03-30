class FeaturedWorkController < ApplicationController

  def index
    if valid_api_key?(params[:api_key])
      featured_images = FeaturedImage.all
      render json: FeaturedImageSerializer.index(featured_images)
    else
      render json: ErrorSerializer.main(["api_key param is either missing or invalid"])
    end
  end

end
