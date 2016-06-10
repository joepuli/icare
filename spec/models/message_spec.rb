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
  it { is_expected.to validate_associated(:to) }
  it { is_expected.to validate_associated(:from) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_length_of(:body).within(1..3000) }
end
