class SocialsController < ApplicationController

  def index
    if valid_api_key?(params[:api_key])
      spreadsheet_id = "1dezRYzkCZ8VrfsbO2EKVoF9D_hIHsKAF_BuI7b83phA"
      selection1 = "B5"
      selection2 = "B8"
      # binding.pry
      socials = GoogleSheetsFacade.get_sheet_data(spreadsheet_id, selection1, selection2)
      socials = [[], [], [], []] if socials.nil?
      
      instagram = socials[0][0]
      twitter = socials[1][0]
      behance = socials[2][0]
      youtube = socials[3][0]

      render json: {
        instagram: instagram,
        twitter: twitter,
        behance: behance,
        youtube: youtube
      }
    else
      render json: ErrorSerializer.main(["api_key param is either missing or invalid"]), status: 401
    end
  end

end
