require 'rails_helper'

RSpec.describe License, type: :model do
  # include documents
  it { is_expected.to be_timestamped_document }
  it { is_expected.to be_timestamped_document.with(:created) }
  it { is_expected.to be_timestamped_document.with(:updated) }

  # associations
  it { is_expected.to be_embedded_in(:profile) }

  # fields
  it { is_expected.to have_field(:t).with_alias(:training_classes) }
  it do
    is_expected.to have_field(:f).with_alias(:been_a_foster_parent)
      .of_type(Mongoid::Boolean)
  end
  it { is_expected.to have_field(:c).with_alias(:current_license) }
  it do
    is_expected.to have_field(:lc).with_alias(:completed_on)
      .of_type(Date)
  end
  it do
    is_expected.to have_field(:lu).with_alias(:updated_on)
      .of_type(Date)
  end

  # validations
  it { is_expected.to validate_presence_of(:training_classes) }
  it { is_expected.to validate_presence_of(:been_a_foster_parent) }
  it { is_expected.to validate_presence_of(:current_license) }
  it { is_expected.to validate_presence_of(:completed_on) }
end
