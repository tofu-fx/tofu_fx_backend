require 'rails_helper'

RSpec.describe 'About Me Blurp Endpoint' do
  it 'fetches about me blurb' do
    get "/about_me?api_key=#{ENV['api_key']}"

    about_me = JSON.parse(response.body, symbolize_names: true)
    # binding.pry
    expect(about_me.keys).to eq([:data])
    expect(about_me[:data]).to be_a(String)
  end

  it 'doesnt fetch about me blurb if api key is missing' do
    get "/about_me"

    images = JSON.parse(response.body, symbolize_names: true)

    expect(images.keys).to eq([:errors])
    expect(images[:errors]).to eq(["api_key param is either missing or invalid"])
  end

  it 'doesnt fetch about me blurb if api key is invalid' do
    get "/about_me?api_key=invalid_api_key"

    images = JSON.parse(response.body, symbolize_names: true)

    expect(images.keys).to eq([:errors])
    expect(images[:errors]).to eq(["api_key param is either missing or invalid"])
  end
end
