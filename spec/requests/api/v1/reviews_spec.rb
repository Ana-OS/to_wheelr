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
      expect(response).to have_http_status(:success)
    end

    it "returns an array of objects" do
      expect(json).to be_kind_of(Array)
    end
  end

  context "GET /show" do
    before do
      review = FactoryBot.create(:review)
      get "/api/v1/reviews/#{review.id}"
    end

    it "returns the correct json" do
      expect(json).to match_json_schema("review")
    end

    it "responds with a 200 status" do
      expect(response).to have_http_status(:success)
    end
  end

  context "POST review" do
    before do
      @review_params = attributes_for(:review)
      @bicycle = FactoryBot.create(:bicycle)
      @user1 = FactoryBot.build(:user)
    end

    it 'returns a created status' do
      sign_in(@user1)
      post "/api/v1/bicycles/#{@bicycle.id}/reviews", params: {review: @review_params}
      expect(response).to have_http_status(:created)
    end

    it 'does not allow to create a review without a logged in user' do
      sign_out(@user1)
      post "/api/v1/bicycles/#{@bicycle.id}/reviews", params: {review: @review_params}
      expect(response).to have_http_status(:unauthorized)
    end

    it 'does not allow to create a review without required params' do
      sign_in(@user1)
      @review_params[:rating] = nil
      post "/api/v1/bicycles/#{@bicycle.id}/reviews", params: {review: @review_params}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context "PATCH review" do
    before do
      @review = FactoryBot.create(:review)
      @user1 = FactoryBot.build(:user)
    end

    it 'returns a ok status' do
      sign_in(@user1)
      @review[:comment] += "- updated"
      patch "/api/v1/reviews/#{@review.id}", params: {review: @review.attributes}
      expect(response).to have_http_status(:ok)
    end

    it 'does not allow to update a review without a logged in user' do
      sign_out(@user1)
      patch "/api/v1/reviews/#{@review.id}", params: {review: @review.attributes}
      expect(response).to have_http_status(:unauthorized)
    end

    it 'does not allow to create a review without required params' do
      sign_in(@user1)
      @review[:rating] = nil
      patch "/api/v1/reviews/#{@review.id}", params: {review: @review.attributes}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
