require 'rails_helper'

RSpec.describe Address, type: :model do
  # include documents
  it { is_expected.to be_timestamped_document }
  it { is_expected.to be_timestamped_document.with(:created) }
  it { is_expected.to be_timestamped_document.with(:updated) }

  # associations
  it { is_expected.to belong_to(:addressable) }

  # fields
  it { is_expected.to have_field(:a1).with_alias(:home_address) }
  it { is_expected.to have_field(:a2).with_alias(:address_2) }
  it { is_expected.to have_field(:city) }
  it { is_expected.to have_field(:s).with_alias(:state) }
  it { is_expected.to have_field(:z).with_alias(:zip) }
  it { is_expected.to have_field(:c).with_alias(:country) }
  it { is_expected.to have_field(:co).with_alias(:coordinates).of_type(Array) }

  # validations
  it { is_expected.to validate_presence_of(:home_address) }

  # instance methods
  let(:address) { build(:address, home_address: 'hello', city: 'world') }

  describe '#full_address' do
    it 'joins address attributes to string' do
      expect(address.full_address).to eq 'hello, world'
    end
  end
end
