require 'rails_helper'

RSpec.describe Physical, type: :model do
  # include documents
  it { is_expected.to be_timestamped_document }
  it { is_expected.to be_timestamped_document.with(:created) }
  it { is_expected.to be_timestamped_document.with(:updated) }

  # associations
  it { is_expected.to be_embedded_in(:preference) }

  # fields
  it do
    is_expected.to have_field(:p)
      .with_alias(:hightest_level_of_physical_or_medical_disability_in_a_child_your_family_will_consider)
  end

  # validations
  it { is_expected.to validate_presence_of(:p) }
  it do
    is_expected.to validate_inclusion_of(:p)
      .to_allow(Physical::SEVERITY)
  end
end
