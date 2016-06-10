require 'rails_helper'

RSpec.describe Preference, type: :model do
  let(:preference) { build(:preference) }

  # include documents
  it { is_expected.to be_timestamped_document }
  it { is_expected.to be_timestamped_document.with(:created) }
  it { is_expected.to be_timestamped_document.with(:updated) }

  # associations
  it { is_expected.to belong_to(:profile) }
  it { is_expected.to embed_one(:behavior) }
  it { is_expected.to embed_one(:learning) }
  it { is_expected.to embed_one(:development) }
  it { is_expected.to embed_one(:emotion) }
  it { is_expected.to embed_one(:physical) }
  it { is_expected.to have_many(:risks) }

  # fields
  it { is_expected.to have_field(:g).with_alias(:gender) }
  it { is_expected.to have_field(:rc).with_alias(:racial_composition) }
  it { is_expected.to have_field(:yac).with_alias(:youngest_age_acceptable) }
  it { is_expected.to have_field(:oac).with_alias(:oldest_age_acceptable) }
  it do
    is_expected.to have_field(:minc).with_alias(:minimum_number_of_children)
      .of_type(Integer)
  end
  it do
    is_expected.to have_field(:maxc).with_alias(:maximum_number_of_children)
      .of_type(Integer)
  end
  it do
    is_expected.to have_field(:lgbtq).with_alias(:consider_LGBTQ_youth)
      .of_type(Mongoid::Boolean).with_default_value_of(false)
  end

  # validations
  it { is_expected.to validate_associated(:risks) }
  it { is_expected.to validate_presence_of(:gender) }
  it do
    is_expected.to validate_inclusion_of(:gender)
      .to_allow(Preference::GENDER)
  end
  it { is_expected.to validate_presence_of(:racial_composition) }
  it { is_expected.to validate_presence_of(:youngest_age_acceptable) }
  it do
    is_expected.to validate_inclusion_of(:youngest_age_acceptable)
      .to_allow(Preference::ACCEPTABLE_RANGE)
  end
  it { is_expected.to validate_presence_of(:oldest_age_acceptable) }
  it do
    is_expected.to validate_inclusion_of(:oldest_age_acceptable)
      .to_allow(Preference::ACCEPTABLE_RANGE)
  end
  it { is_expected.to validate_presence_of(:minimum_number_of_children) }
  it do
    is_expected.to validate_inclusion_of(:minimum_number_of_children)
      .to_allow(Preference::QUANTITY)
  end
  it { is_expected.to validate_presence_of(:maximum_number_of_children) }
  it do
    is_expected.to validate_inclusion_of(:maximum_number_of_children)
      .to_allow(Preference::QUANTITY)
  end
  it { is_expected.to validate_presence_of(:consider_LGBTQ_youth) }
  it do
    is_expected.to validate_inclusion_of(:racial_composition)
      .to_allow(Preference::COMPOSITION)
  end
  it do
    is_expected.to validate_numericality_of(:maximum_number_of_children)
      .greater_than_or_equal_to(:minimum_number_of_children)
  end
  it 'validate #oldest_cannot_be_less_than_youngest' do
    preference.youngest_age_acceptable = '2'
    preference.oldest_age_acceptable = 'infant'
    preference.valid?
    expect(preference.errors.full_messages).to \
      include("Oldest age acceptable can't be less than youngest age acceptable")
  end
end
