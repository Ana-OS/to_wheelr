require 'rails_helper'


RSpec.describe Bicycle, type: :model do

  it "validates bicycle type is one of the accepted types" do
    bici = build(:bicycle, bicycle_type: "wrong_type")
    expect(bici).to_not be_valid
  end

  it "validates bicycle type is one of the accepted types" do
    bici = build(:bicycle, bicycle_type: "tandem")
    expect(bici).to be_valid
  end

  it "validates number of wheels is an integer" do
    bici = build(:bicycle, number_wheels: "string")
    expect(bici).to_not be_valid
  end

  it "validates price per day is an integer" do
    bici = build(:bicycle, price_day: "string")
    expect(bici).to_not be_valid
  end

  context 'Bicycle required attributes' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:brand) }
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to validate_presence_of(:number_wheels) }
    it { is_expected.to validate_presence_of(:bicycle_type) }
    it { should allow_value([true, false]).for(:foldable) }
  end

  context ' Bicycle association' do
    it { should belong_to(:user) }
    # it { should have_many(:reviews) }
  end


end
