require 'rails_helper'

RSpec.describe GoogleSheetsService do

  describe 'self.conn' do
    it 'creates a Faraday::Connection object', :vcr do
      expect(GoogleSheetsService.conn).to be_a(Faraday::Connection)
    end
  end

  describe 'self.get_sheet_data' do
    it 'fetches sheet data', :vcr do
      spreadsheet_id = "1dezRYzkCZ8VrfsbO2EKVoF9D_hIHsKAF_BuI7b83phA"
      selection1 = "B2"
      selection2 = "B30"

      response_body = GoogleSheetsService.get_sheet_data(spreadsheet_id, selection1, selection2)

      expect(response_body.keys).to eq([:range, :majorDimension, :values])
      expect(response_body[:range]).to be_a(String)
      expect(response_body[:majorDimension]).to eq("ROWS")
      expect(response_body[:values]).to be_a(Array)
      expect(response_body[:values].first).to be_a(Array)
      expect(response_body[:values].first.first).to be_a(String)
    end
  end

end
