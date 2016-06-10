require 'rails_helper'

RSpec.describe Child, type: :model do
  # include documents
  it { is_expected.to be_timestamped_document }
  it { is_expected.to be_timestamped_document.with(:created) }
  it { is_expected.to be_timestamped_document.with(:updated) }

  # associations
  it { is_expected.to be_embedded_in(:profile) }
  it { is_expected.to have_many(:races) }

  # fields
  it do
    is_expected.to have_field(:dob).with_alias(:birth_month_and_year)
      .of_type(Date)
  end

  it { is_expected.to have_field(:g).with_alias(:gender) }

  it do
    is_expected.to have_field(:in).with_alias(:child_became_part_of_family_by)
  end
  it do
    is_expected.to have_field(:cd).with_alias(:any_challenges_or_disabilities?)
  end

  # validations
  it { is_expected.to validate_presence_of(:birth_month_and_year) }
  it { is_expected.to validate_presence_of(:gender) }
  it { is_expected.to validate_presence_of(:child_became_part_of_family_by) }
  it do
    is_expected.to validate_inclusion_of(:child_became_part_of_family_by)
      .to_allow(Child::MEMBERSHIP)
  end
  it { is_expected.to validate_associated(:races) }

  # nested attribtes
  it { is_expected.to accept_nested_attributes_for(:races) }
end
