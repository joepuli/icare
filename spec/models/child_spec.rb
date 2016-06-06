require 'rails_helper'

RSpec.describe Child, type: :model do
  # include documents
  it { is_expected.to be_timestamped_document }
  it { is_expected.to be_timestamped_document.with(:created) }
  it { is_expected.to be_timestamped_document.with(:updated) }

  # associations
  it { is_expected.to be_embedded_in(:profile) }

  # fields
  it do
    is_expected.to have_field(:dob).with_alias(:birth_month_and_year)
      .of_type(Date)
  end

  it { is_expected.to have_field(:g).with_alias(:gender) }
  it do
    is_expected.to have_field(:r).with_alias(:race)
      .of_type(Array)
  end

  it do
    is_expected.to have_field(:in).with_alias(:child_became_part_of_family_by)
  end
  it do
    is_expected.to have_field(:cd).with_alias(:any_challenges_or_disabilities?)
  end

  # validations
  it { is_expected.to validate_presence_of(:birth_month_and_year) }
  it { is_expected.to validate_presence_of(:gender) }
  it { is_expected.to validate_presence_of(:race) }
  it { is_expected.to validate_presence_of(:child_became_part_of_family_by) }
  it do
    is_expected.to validate_inclusion_of(:child_became_part_of_family_by)
      .to_allow(Child::MEMBERSHIP)
  end
  it do
    is_expected.to validate_inclusion_of(:race)
      .to_allow(Child::RACE)
  end
end
