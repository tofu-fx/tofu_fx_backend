require 'rails_helper'

RSpec.describe 'Fetch All Image URLS' do

  it 'fetches all image urls' do
    FeaturedImage.create!(url: "https://url1")
    FeaturedImage.create!(url: "https://url2")
    FeaturedImage.create!(url: "https://url3")

    get "/featured_work?api_key=#{ENV['api_key']}"

    images = JSON.parse(response.body, symbolize_names: true)

    expect(images.keys).to eq([:data])
    expect(images[:data].keys).to eq([:urls])
    expect(images[:data][:urls]).to be_a(Array)
    expect(images[:data][:urls].include?("https://url1")).to eq(true)
    expect(images[:data][:urls].include?("https://url2")).to eq(true)
    expect(images[:data][:urls].include?("https://url3")).to eq(true)
    expect(images[:data][:urls].include?("https://google.com")).to eq(false)
  end

  it 'doesnt fetch images if api key is missing' do
    FeaturedImage.create!(url: "https://url1")
    FeaturedImage.create!(url: "https://url2")
    FeaturedImage.create!(url: "https://url3")

    get "/featured_work"

    images = JSON.parse(response.body, symbolize_names: true)

    expect(images.keys).to eq([:errors])
    expect(images[:errors]).to eq(["api_key param is either missing or invalid"])
  end

  it 'doesnt fetch images if api key is invalid' do
    FeaturedImage.create!(url: "https://url1")
    FeaturedImage.create!(url: "https://url2")
    FeaturedImage.create!(url: "https://url3")

    get "/featured_work?api_key=invalid_api_key"

    images = JSON.parse(response.body, symbolize_names: true)

    expect(images.keys).to eq([:errors])
    expect(images[:errors]).to eq(["api_key param is either missing or invalid"])
  end

end
