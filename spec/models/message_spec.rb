require 'rails_helper'

RSpec.describe Message, type: :model do
  # include documents
  it { is_expected.to be_timestamped_document }
  it { is_expected.to be_timestamped_document.with(:created) }
  it { is_expected.to be_timestamped_document.with(:updated) }

  # associations
  it { is_expected.to belong_to(:conversation) }
  it { is_expected.to belong_to(:to).of_type(User) }
  it { is_expected.to belong_to(:from).of_type(User) }

  # validation
  it { is_expected.to validate_presence_of(:to) }
  it { is_expected.to validate_presence_of(:from) }

  # nested attributes
  it { is_expected.to accept_nested_attributes_for(:conversation) }
end
