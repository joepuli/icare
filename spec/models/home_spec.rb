require 'rails_helper'

RSpec.describe Home, type: :model do
  # include documents
  it { is_expected.to be_timestamped_document }
  it { is_expected.to be_timestamped_document.with(:created) }
  it { is_expected.to be_timestamped_document.with(:updated) }

  # associations
  it { is_expected.to be_embedded_in(:profile) }
  it { is_expected.to embed_one(:address) }

  # nested attributes
  it { is_expected.to accept_nested_attributes_for(:address) }

  # fields
  it do
    is_expected.to have_field(:t)
      .with_alias(:can_family_travel_for_preplacement_visits)
  end

  it do
    is_expected.to have_field(:pay)
      .with_alias(:can_family_pay_for_preplacement_visits)
  end

  it do
    is_expected.to have_field(:w)
      .with_alias(:is_your_home_wheelchair_accessible)
  end

  it do
    is_expected.to have_field(:pet)
      .with_alias(:pets_in_the_home)
  end
  it { is_expected.to have_field(:at).with_alias(:address_type) }

  # validation
  it do
    is_expected.to validate_presence_of(:is_your_home_wheelchair_accessible)
  end

  it do
    is_expected.to validate_inclusion_of(:pets_in_the_home)
      .to_allow(Home::PETS)
  end

  it do
    is_expected.to validate_inclusion_of(:can_family_travel_for_preplacement_visits)
      .to_allow(Home::OPTIONS)
  end
  it do
    is_expected.to validate_inclusion_of(:can_family_pay_for_preplacement_visits)
      .to_allow(Home::OPTIONS)
  end

end
