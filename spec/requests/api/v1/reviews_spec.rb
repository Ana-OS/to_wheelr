require 'rails_helper'

RSpec.describe "Api::V1::Reviews", type: :request do
   context "GET /index" do

    before do
      @bicycle = FactoryBot.create(:bicycle)
      reviews = FactoryBot.create_list(:review, 3)
      get "/api/v1/bicycles/#{@bicycle.id}/reviews"
    end

    it "returns the correct json" do
      expect(response).to match_json_schema("reviews")
    end

    it "is returns a non empty array" do
      expect(json).to_not be_empty
    end

    it "responds with a 200 status" do
      expect(response.status).to match(200)
      # expect(response).to have_http_status(:success)
    end

    it "returns an array of objects" do
      expect(json).to be_kind_of(Array)
    end
  end
end
