require 'rails_helper'

RSpec.describe Conversation, type: :model do
  # include documents
  it { is_expected.to be_timestamped_document }
  it { is_expected.to be_timestamped_document.with(:created) }
  it { is_expected.to be_timestamped_document.with(:updated) }

  # associations
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:messages).with_dependent(:destroy) }

  # fields
  it { is_expected.to have_field(:s).with_alias(:subject) }

  # validates
  it { is_expected.to validate_presence_of(:subject) }
  it { is_expected.to validate_length_of(:subject).within(1..200) }
  it { is_expected.to validate_associated(:messages) }
end
