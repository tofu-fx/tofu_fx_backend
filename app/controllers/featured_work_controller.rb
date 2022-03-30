class FeaturedWorkController < ApplicationController

  def index # Returns an array of ALL featured image urls
    if valid_api_key?(params[:api_key])
      spreadsheet_id = "1dezRYzkCZ8VrfsbO2EKVoF9D_hIHsKAF_BuI7b83phA"
      selection1 = "B2"
      selection2 = "B30"
      # binding.pry
      featured_image_urls = GoogleSheetsFacade.get_sheet_data(spreadsheet_id, selection1, selection2).map do |row|
        row[0]
      end

      render json: FeaturedImageSerializer.index(featured_image_urls)
    else
      render json: ErrorSerializer.main(["api_key param is either missing or invalid"]), status: 401
    end
  end

end
