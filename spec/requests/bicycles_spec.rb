require 'rails_helper'

RSpec.describe "Bicycles", type: :request do
  context "GET /index" do

    before do
      FactoryBot.create_list(:bicycle, 2)
      get '/api/v1/bicycles'
    end

    it "returns the correct json" do
      expect(response).to match_json_schema("bicycles")
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

  context "GET /show" do
    before do
      bici = FactoryBot.create(:bicycle)
      get "/api/v1/bicycles/#{bici.id}"
    end

    it "returns the correct json" do
      expect(json).to match_json_schema("bicycle")
    end

    it "responds with a 200 status" do
      expect(response.status).to match(200)
      # expect(response).to have_http_status(:success)
    end
  end

  context "POST /bicycle" do
    before do
      @bicycle_params = attributes_for(:bicycle)
      @user1 = FactoryBot.build(:user)
    end

    it 'returns a created status' do
      sign_in(@user1)
      post "/api/v1/bicycles", params: {bicycle: @bicycle_params}
      expect(response).to have_http_status(:created)
    end

    it 'does not allow to create a bicycle without a logged in user' do
      sign_out(@user1)
      post "/api/v1/bicycles", params: {bicycle: @bicycle_params}
      expect(response).to have_http_status(:unauthorized)
    end

    it 'does not allow to create a bicycle without required params' do
      sign_in(@user1)
      @bicycle_params[:name] = ""
      post "/api/v1/bicycles", params: {bicycle: @bicycle_params}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context "PATCH edit/update" do
    before do
      @bicycle  = FactoryBot.create(:bicycle)
      @user = FactoryBot.build(:user)
    end

    it "updates bicycle if user is logged in" do
      sign_in(@user)
      @bicycle["name"] += " -updated"
      patch "/api/v1/bicycles/#{@bicycle.id}", params: {bicycle: @bicycle.attributes}
      expect(response).to have_http_status(:created)
    end

    it "does not update if user is not logged in" do
      @bicycle["name"] += " -updated"
      patch "/api/v1/bicycles/#{@bicycle.id}", params: {bicycle: @bicycle.attributes}
      expect(response).to have_http_status(:unauthorized)
    end

    it "returns the correct json" do
      sign_in(@user)
      @bicycle["name"] += " -updated"
      patch "/api/v1/bicycles/#{@bicycle.id}", params: {bicycle: @bicycle.attributes}
      expect(json).to match_json_schema("bicycle")
    end

    it "does not update with invalid parameters" do
      sign_in(@user)
      @bicycle["name"] = nil
      patch "/api/v1/bicycles/#{@bicycle.id}", params: {bicycle: @bicycle.attributes}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context "DELETE bicycle" do
    before do
      @bicycle = FactoryBot.create(:bicycle)
      @user = FactoryBot.build(:user)
    end

    it "returns status code 204" do
      sign_in(@user)
      delete "/api/v1/bicycles/#{@bicycle.id}"
      expect(response.status).to eq(204)
    end

    it "does not allow delete if user is not logged in" do
      sign_out(@user)
      delete "/api/v1/bicycles/#{@bicycle.id}"
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
