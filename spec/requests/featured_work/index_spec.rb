require 'rails_helper'

RSpec.describe 'Fetch All Image URLS' do

  it 'fetches all image urls' do
    get "/featured_work?api_key=#{ENV['api_key']}"

    images = JSON.parse(response.body, symbolize_names: true)
    # binding.pry
    expect(images.keys).to eq([:data])
    expect(images[:data].keys).to eq([:featured_images])
    expect(images[:data][:featured_images]).to be_a(Array)
    expect(images[:data][:featured_images].first).to be_a(String)
  end

  it 'doesnt fetch images if api key is missing' do
    get "/featured_work"

    images = JSON.parse(response.body, symbolize_names: true)

    expect(images.keys).to eq([:errors])
    expect(images[:errors]).to eq(["api_key param is either missing or invalid"])
  end

  it 'doesnt fetch images if api key is invalid' do
    get "/featured_work?api_key=invalid_api_key"

    images = JSON.parse(response.body, symbolize_names: true)

    expect(images.keys).to eq([:errors])
    expect(images[:errors]).to eq(["api_key param is either missing or invalid"])
  end

end
