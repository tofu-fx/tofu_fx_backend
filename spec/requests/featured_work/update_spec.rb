require 'rails_helper'

RSpec.describe 'Update Featured Images Endpoint' do

  it 'updates all image urls' do
    FeaturedImage.create!(url: "https://url1")
    FeaturedImage.create!(url: "https://url2")
    FeaturedImage.create!(url: "https://url3")

    patch "/featured_work?api_key=#{ENV['api_key']}&urls[]=newurl1&urls[]=newurl2"

    images = JSON.parse(response.body, symbolize_names: true)
    # binding.pry
    expect(images.keys).to eq([:data])
    expect(images[:data].keys).to eq([:featured_images])
    expect(images[:data][:featured_images]).to be_a(Array)
    expect(images[:data][:featured_images].first.keys).to eq([:id, :url])
    expect(images[:data][:featured_images].first[:id]).to be_a(Integer)
    expect(images[:data][:featured_images].first[:url]).to be_a(String)

    images_from_db = FeaturedImage.all.map do |image|
      image.url
    end
    expect(images_from_db.include?('newurl1')).to eq(true)
    expect(images_from_db.include?('newurl2')).to eq(true)
    expect(images_from_db.include?('https://url1')).to eq(false)
    expect(images_from_db.include?('https://url2')).to eq(false)
    expect(images_from_db.include?('https://url3')).to eq(false)
  end

  it 'doesnt update images if api key is missing' do
    FeaturedImage.create!(url: "https://url1")
    FeaturedImage.create!(url: "https://url2")
    FeaturedImage.create!(url: "https://url3")

    patch "/featured_work"

    images = JSON.parse(response.body, symbolize_names: true)

    expect(images.keys).to eq([:errors])
    expect(images[:errors]).to eq(["api_key param is either missing or invalid"])
  end

  it 'doesnt update images if api key is invalid' do
    FeaturedImage.create!(url: "https://url1")
    FeaturedImage.create!(url: "https://url2")
    FeaturedImage.create!(url: "https://url3")

    patch "/featured_work?api_key=invalid_api_key"

    images = JSON.parse(response.body, symbolize_names: true)

    expect(images.keys).to eq([:errors])
    expect(images[:errors]).to eq(["api_key param is either missing or invalid"])
  end

end
