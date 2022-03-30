require 'rails_helper'

RSpec.describe FeaturedImage, type: :model do

  it { should validate_presence_of(:url) }

  it 'exists' do
    featured_image = FeaturedImage.create!(url: "url goes here")

    expect(featured_image).to be_a(FeaturedImage)
    expect(featured_image.valid?).to eq(true)
  end

end
