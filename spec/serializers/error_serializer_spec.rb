require 'rails_helper'

RSpec.describe ErrorSerializer do

  describe 'self.main' do
    it 'returns correct json' do
      errors = ["this is an error", "this is another error"]

      json = ErrorSerializer.main(errors)

      expect(json.keys).to eq([:errors])
      expect(json[:errors]).to eq(["this is an error", "this is another error"])
    end
  end
end
