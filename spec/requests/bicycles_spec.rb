require 'rails_helper'

RSpec.describe "Bicycles", type: :request do
  context "GET /index" do

    before do
      FactoryBot.create_list(:bicycle, 2)
      get '/api/v1/bicycles'
    end

    it "returns the correct json" do
      expect(response).to match_json_schema("index")
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

  # context "GET /show" do
  #   before { get '/api/v1/bicycles/:id' }

  #   it "returns the correct json" do
  #     expect(json).to match_json_schema("index")
  #   end

  #   it "responds with a 200 status" do
  #     expect(response.status).to match(200)
  #     # expect(response).to have_http_status(:success)
  #   end
  # end
end
