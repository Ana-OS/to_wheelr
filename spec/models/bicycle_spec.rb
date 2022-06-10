require 'rails_helper'


RSpec.describe Bicycle, type: :model do
  context 'Bicycle required attributes' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:brand) }
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to validate_presence_of(:number_wheels) }
    it { is_expected.to validate_presence_of(:bicycle_type) }
    it { is_expected.to validate_presence_of(:foldable) }
  end
end
