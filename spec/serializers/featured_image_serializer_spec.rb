require 'rails_helper'

RSpec.describe FeaturedImageSerializer do

  describe 'self.urls' do
    it 'returns correct json' do
      featured_image_1 = FeaturedImage.create!(url: "url1")
      featured_image_2 = FeaturedImage.create!(url: "url2")

      json = FeaturedImageSerializer.index([featured_image_1, featured_image_2])

      expect(json.keys).to eq([:data])
      expect(json[:data].keys).to eq([:featured_images])
      expect(json[:data][:featured_images]).to be_a(Array)
      expect(json[:data][:featured_images].first.keys).to eq([:id, :url])
      expect(json[:data][:featured_images].first[:id]).to be_a(Integer)
      expect(json[:data][:featured_images].first[:url]).to be_a(String)
    end
  end

end
