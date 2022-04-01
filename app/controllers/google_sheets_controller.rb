class GoogleSheetsController < ApplicationController

  def index
    if valid_api_key?(params[:api_key]) && params[:sheet_id] && params[:selection_1] && params[:selection_2]

      data = GoogleSheetsService.get_sheet_data(params[:sheet_id], params[:selection_1], params[:selection_2])

      render json: data
    elsif valid_api_key?(params[:api_key])
      render json: ErrorSerializer.main(["missing params"]), status: 401
    else
      render json: ErrorSerializer.main(["api_key param is either missing or invalid"]), status: 401
    end
  end

end
