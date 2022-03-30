class GoogleSheetsFacade

  def self.service
    @service ||= GoogleSheetsService
  end

  def self.get_sheet_data(spreadsheet_id, selection1, selection2)
    response_body = service.get_sheet_data(spreadsheet_id, selection1, selection2)

    response_body[:values]
  end

end
