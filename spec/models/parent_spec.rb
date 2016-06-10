require 'rails_helper'

RSpec.describe Parent, type: :model do
  # include documents
  it { is_expected.to be_timestamped_document }
  it { is_expected.to be_timestamped_document.with(:created) }
  it { is_expected.to be_timestamped_document.with(:updated) }

  # associations
  it { is_expected.to be_embedded_in(:profile) }

  # fields
  it { is_expected.to have_field(:fn).with_alias(:first_name) }
  it { is_expected.to have_field(:mn).with_alias(:middle_name) }
  it { is_expected.to have_field(:ln).with_alias(:last_name) }
  it do
    is_expected.to have_field(:dob).with_alias(:date_of_birth)
      .of_type(Date)
  end
  it { is_expected.to have_field(:g).with_alias(:gender) }
  it { is_expected.to have_field(:re).with_alias(:religion) }
  it { is_expected.to have_field(:pl).with_alias(:primary_language) }
  it { is_expected.to have_field(:sl).with_alias(:secondary_language) }
  it do
    is_expected.to have_field(:md).with_alias(:active_or_reserve_duty_military)
      .of_type(Mongoid::Boolean)
      .with_default_value_of(false)
  end
  it { is_expected.to have_field(:o).with_alias(:occupation) }
  it { is_expected.to have_field(:rs).with_alias(:relationship_status) }

  # validations
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:date_of_birth) }
  it { is_expected.to validate_presence_of(:gender) }
  it do
    is_expected.to validate_inclusion_of(:gender).to_allow(%w(Male Female))
  end
  it { is_expected.to validate_presence_of(:primary_language) }
  it do
    is_expected.to validate_inclusion_of(:primary_language)
      .to_allow(Parent::LANGUAGE)
  end
  it { is_expected.to validate_presence_of(:active_or_reserve_duty_military) }
  it { is_expected.to validate_presence_of(:relationship_status) }
  it do
    is_expected.to validate_inclusion_of(:relationship_status)
      .to_allow(Parent::RELATIONSHIP_STATUS)
  end
  it do
    is_expected.to validate_inclusion_of(:religion)
      .to_allow(Parent::RELIGION)
  end
end
