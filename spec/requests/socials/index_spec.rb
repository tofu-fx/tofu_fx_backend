require 'rails_helper'

RSpec.describe 'Social Links Endpoint' do
  it 'fetches socials', :vcr do
    get "/socials?api_key=#{ENV['api_key']}"

    socials = JSON.parse(response.body, symbolize_names: true)
    # binding.pry
    expect(socials.keys).to eq([:instagram, :twitter, :behance, :youtube])
    expect(socials[:instagram]).to be_a(String).or be_a(NilClass)
    expect(socials[:twitter]).to be_a(String).or be_a(NilClass)
    expect(socials[:behance]).to be_a(String).or be_a(NilClass)
    expect(socials[:youtube]).to be_a(String).or be_a(NilClass)
  end

  it 'doesnt fetch socials if api key is missing', :vcr do
    get "/socials"

    socials = JSON.parse(response.body, symbolize_names: true)

    expect(socials.keys).to eq([:errors])
    expect(socials[:errors]).to eq(["api_key param is either missing or invalid"])
  end

  it 'doesnt fetch socials if api key is invalid', :vcr do
    get "/socials?api_key=invalid_api_key"

    socials = JSON.parse(response.body, symbolize_names: true)

    expect(socials.keys).to eq([:errors])
    expect(socials[:errors]).to eq(["api_key param is either missing or invalid"])
  end
end
