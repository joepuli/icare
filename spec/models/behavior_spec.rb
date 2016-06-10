require 'rails_helper'

RSpec.describe Behavior, type: :model do
  # include documents
  it { is_expected.to be_timestamped_document }
  it { is_expected.to be_timestamped_document.with(:created) }
  it { is_expected.to be_timestamped_document.with(:updated) }

  # associations
  it { is_expected.to be_embedded_in(:preference) }

  # fields
  it do
    is_expected.to have_field(:b)
      .with_alias(:highest_level_of_behavior_issue_your_family_will_consider)
  end

  # validations
  it { is_expected.to validate_presence_of(:b) }
  it do
    is_expected.to validate_inclusion_of(:b)
      .to_allow(Behavior::SEVERITY)
  end
end
