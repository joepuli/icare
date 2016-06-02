require 'rails_helper'

RSpec.describe Address, type: :model do
  # associations
  it { is_expected.to belong_to(:addressable) }

  # fields
  it do
    is_expected.to have_fields(:coordinates, :address_1,
                               :address_1, :city, :state, :zip)
  end

  # instance methods
  let(:address) { build(:address, address_1: 'hello', city: 'world') }

  describe '#full_address' do
    it 'joins address attributes to string' do
      expect(address.full_address).to eq 'hello, world'
    end
  end
end
