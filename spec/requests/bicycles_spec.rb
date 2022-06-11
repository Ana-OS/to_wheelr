require 'rails_helper'

RSpec.describe "Bicycles", type: :request do
  describe "GET /index" do
    before { get '/api/v1/bicycles' }

    it "returns the correct json" do
      expect(json).to match_json_schema("index")
    end
  end
end
