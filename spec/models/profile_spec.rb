require 'rails_helper'

RSpec.describe Profile, type: :model do
  # associations
  it { is_expected.to belong_to(:user) }
  it { is_expected.to embed_many(:trainings) }
  it { is_expected.to embed_many(:courses) }
  it { is_expected.to embed_many(:preferences) }

  # nested attributes
  it { is_expected.to accept_nested_attributes_for(:trainings) }
  it { is_expected.to accept_nested_attributes_for(:courses) }
  it { is_expected.to accept_nested_attributes_for(:preferences) }

  # instance methods
  let(:profile) { build(:profile) }

  describe '#full_name' do
    it 'joins first, middle, and last name' do
      profile.write_attributes(
        first_name: 'Albert',
        last_name: 'Einstein'
      )
      expect(profile.full_name).to eq 'Albert Einstein'
    end
  end
end
