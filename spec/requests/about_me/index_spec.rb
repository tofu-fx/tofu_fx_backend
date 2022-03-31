require 'rails_helper'

RSpec.describe 'About Me Blurp Endpoint' do
  it 'fetches about me blurb', :vcr do
    get "/about_me?api_key=#{ENV['api_key']}"

    about_me = JSON.parse(response.body, symbolize_names: true)
    # binding.pry
    expect(about_me.keys).to eq([:data])
    expect(about_me[:data]).to be_a(String)
  end

  it 'doesnt fetch about me blurb if api key is missing', :vcr do
    get "/about_me"

    about_me = JSON.parse(response.body, symbolize_names: true)

    expect(about_me.keys).to eq([:errors])
    expect(about_me[:errors]).to eq(["api_key param is either missing or invalid"])
  end

  it 'doesnt fetch about me blurb if api key is invalid', :vcr do
    get "/about_me?api_key=invalid_api_key"

    about_me = JSON.parse(response.body, symbolize_names: true)

    expect(about_me.keys).to eq([:errors])
    expect(about_me[:errors]).to eq(["api_key param is either missing or invalid"])
  end
end
