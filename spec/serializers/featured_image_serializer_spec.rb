require 'rails_helper'

RSpec.describe FeaturedImageSerializer do

  describe 'self.urls' do
    it 'returns correct json' do
      image_urls = [
        "firsturl",
        "secondurl",
        "thirdurl"
      ]
      json = FeaturedImageSerializer.index(image_urls)

      expect(json.keys).to eq([:data])
      expect(json[:data].keys).to eq([:featured_images])
      expect(json[:data][:featured_images]).to eq(image_urls)
      expect(json[:data][:featured_images].first).to be_a(String)
    end
  end

end
