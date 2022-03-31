require 'rails_helper'

RSpec.describe GoogleSheetsFacade do

  describe 'self.service' do
    it 'returns a GoogleSheetsService class', :vcr do
      expect(GoogleSheetsFacade.service).to eq(GoogleSheetsService)
    end
  end

  describe 'self.get_sheet_data' do
    it 'returns only the values of sheet data', :vcr do
      spreadsheet_id = "1dezRYzkCZ8VrfsbO2EKVoF9D_hIHsKAF_BuI7b83phA"
      selection1 = "B2"
      selection2 = "B30"

      data = GoogleSheetsFacade.get_sheet_data(spreadsheet_id, selection1, selection2)

      expect(data).to be_a(Array)
      expect(data.first).to be_a(Array)
      expect(data.first.first).to be_a(String)
    end
  end
end
