require 'rails_helper'

RSpec.describe Profile, type: :model do
  # include documents
  it { is_expected.to be_timestamped_document }
  it { is_expected.to be_timestamped_document.with(:created) }
  it { is_expected.to be_timestamped_document.with(:updated) }

  # associations
  it { is_expected.to belong_to(:user) }
  it { is_expected.to embed_one(:license) }
  it { is_expected.to embed_one(:home) }
  it { is_expected.to embed_many(:parents) }
  it { is_expected.to embed_many(:children) }
  it { is_expected.to have_one(:agency) }
  it { is_expected.to have_one(:preference) }

  # nested attributes
  it { is_expected.to accept_nested_attributes_for(:license) }
  it { is_expected.to accept_nested_attributes_for(:home) }
  it { is_expected.to accept_nested_attributes_for(:parents) }
  it { is_expected.to accept_nested_attributes_for(:children) }

  # fields
  it { is_expected.to have_field(:p1).with_alias(:primary_phone) }
  it { is_expected.to have_field(:p2).with_alias(:secondary_phone) }
  it { is_expected.to have_field(:fi).with_alias(:family_introduction) }
  it { is_expected.to have_field(:li).with_alias(:lifestyle_and_interests) }
  it { is_expected.to have_field(:ec).with_alias(:experience_with_children) }
  it { is_expected.to have_field(:sn).with_alias(:support_network) }
  it { is_expected.to have_field(:ar).with_alias(:available_resources) }

  # validations
  it { is_expected.to validate_presence_of(:primary_phone) }
  it { is_expected.to validate_presence_of(:family_introduction) }
  it { is_expected.to validate_presence_of(:lifestyle_and_interests) }
  it { is_expected.to validate_presence_of(:experience_with_children) }
  it do
    is_expected.to validate_length_of(:family_introduction).with_maximum(3000)
  end
  it do
    is_expected.to validate_length_of(:lifestyle_and_interests).with_maximum(3000)
  end
  it do
    is_expected.to validate_length_of(:experience_with_children).with_maximum(3000)
  end
  it do
    is_expected.to validate_length_of(:support_network).with_maximum(3000)
  end
  it do
    is_expected.to validate_length_of(:available_resources).with_maximum(3000)
  end
end
