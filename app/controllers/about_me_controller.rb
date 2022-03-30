class AboutMeController < ApplicationController

  def index
    if valid_api_key?(params[:api_key])
      spreadsheet_id = "1dezRYzkCZ8VrfsbO2EKVoF9D_hIHsKAF_BuI7b83phA"
      selection1 = "B22"
      selection2 = "B22"
      # binding.pry
      about_me = GoogleSheetsFacade.get_sheet_data(spreadsheet_id, selection1, selection2).first[0]
      about_me = "" if about_me.nil?

      render json: { data: about_me }
    else
      render json: ErrorSerializer.main(["api_key param is either missing or invalid"]), status: 401
    end
  end

end
