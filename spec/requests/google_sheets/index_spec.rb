require 'rails_helper'

RSpec.describe "Fetch Google Sheet Data" do

  it 'fetches sheet data if given correct params', :vcr do
    get '/google_sheets/A1/E10/1dezRYzkCZ8VrfsbO2EKVoF9D_hIHsKAF_BuI7b83phA', params: { api_key: ENV['api_key'] }

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body.keys).to eq([:range, :majorDimension, :values])
    expect(response_body[:range]).to be_a(String)
    expect(response_body[:majorDimension]).to eq("ROWS")
    expect(response_body[:values]).to be_a(Array)

    expect(response.status).to eq(200)
  end

  it 'returns google error codes if sheet data is invalid', :vcr do
    get '/google_sheets/A1/E10/--------', params: { api_key: ENV['api_key'] }

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body.keys).to eq([:error])
    expect(response_body[:error].keys).to eq([:code, :message, :status])
    expect(response_body[:error][:code]).to be_a(Integer)
    expect(response_body[:error][:message]).to be_a(String)
    expect(response_body[:error][:status]).to be_a(String)

    expect(response.status).to eq(200)
  end
end
