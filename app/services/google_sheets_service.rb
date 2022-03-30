class GoogleSheetsService

  def self.get_sheet_data(spreadsheet_id, selection1, selection2)
    selection = "#{selection1}%3A#{selection2}" # B2 -> B30

    response = conn.get("spreadsheets/#{spreadsheet_id}/values/#{selection}")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(
      url: 'https://sheets.googleapis.com/v4',
      params: {key: ENV['google_sheets_api_key']}
    )
  end

end
