require 'rails_helper'

RSpec.describe Risk, type: :model do
  # include documents
  it { is_expected.to be_timestamped_document }
  it { is_expected.to be_timestamped_document.with(:created) }
  it { is_expected.to be_timestamped_document.with(:updated) }

  # associations
  it { is_expected.to be_embedded_in(:preference) }

  # fields
  it do
    is_expected.to have_field(:r).with_alias(:risk_factors_your_family_will_consider)
      .of_type(Array)
  end

  # validations
  it do
    is_expected.to validate_inclusion_of(:r)
      .to_allow(Risk::FACTORS)
  end
end
