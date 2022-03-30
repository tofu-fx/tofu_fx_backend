require 'rails_helper'

RSpec.describe FeaturedImageSerializer do

  describe 'self.urls' do
    it 'returns correct json' do
      featured_image_1 = FeaturedImage.create!(url: "url1")
      featured_image_2 = FeaturedImage.create!(url: "url2")

      json = FeaturedImageSerializer.urls([featured_image_1, featured_image_2])

      expect(json.keys).to eq([:data])
      expect(json[:data].keys).to eq([:urls])
      expect(json[:data][:urls]).to be_a(Array)
      expect(json[:data][:urls].include?("url1")).to eq(true)
      expect(json[:data][:urls].include?("url2")).to eq(true)
      expect(json[:data][:urls].include?("https://google.com")).to eq(false)
    end
  end

end
