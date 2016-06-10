require 'rails_helper'

RSpec.describe Risk, type: :model do
  # include documents
  it { is_expected.to be_timestamped_document }
  it { is_expected.to be_timestamped_document.with(:created) }
  it { is_expected.to be_timestamped_document.with(:updated) }

  # associations
  it { is_expected.to belong_to(:preference) }

  # fields
  it { is_expected.to have_field(:n).with_alias(:name) }

  # validations
  it do
    is_expected.to validate_inclusion_of(:n)
      .to_allow(Risk::FACTORS)
  end
end
