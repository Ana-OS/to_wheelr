require 'rails_helper'

RSpec.describe Review, type: :model do

  it "is invalid without a rating" do
    review = build(:review, rating: nil)
    expect(review).to_not be_valid
  end

  it "is invalid without a user " do
    review = build(:review, user: nil)
    expect(review).to_not be_valid
  end

  it "is invalid without a bicycle" do
    review = build(:review, bicycle: nil)
    expect(review).to_not be_valid
  end

  it "is invalid with a rating < 1 or > 5" do
    review = build(:review, rating: 6)
    expect(review).to_not be_valid
  end

  it "is invalid if rating is not a number" do
    review = build(:review, rating: "string")
    expect(review).to_not be_valid
  end
end
