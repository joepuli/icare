require 'rails_helper'

RSpec.describe Conversation, type: :model do
  # lazy instances
  # let(:entity1)  { create(:user) }
  # let(:entity2)  { create(:user) }
  # let(:receipt1) { entity1.send_message(entity2, 'Body', 'Subject') }
  # let(:receipt2) { entity2.reply_to_all(receipt1, 'Reply body 1') }
  # let(:receipt3) { entity1.reply_to_all(receipt2, 'Reply body 2') }
  # let(:receipt4) { entity2.reply_to_all(receipt3, 'Reply body 3') }
  # let(:message1) { receipt1.notification }
  # let(:message4) { receipt4.notification }
  # let(:conversation) { message1.conversation }

  # include documents
  it { is_expected.to be_timestamped_document }
  it { is_expected.to be_timestamped_document.with(:created) }
  it { is_expected.to be_timestamped_document.with(:updated) }

  # associations
  it { is_expected.to have_many(:messages).with_dependent(:destroy) }

  # fields
  it { is_expected.to have_field(:s).with_alias(:subject) }

  # validates
  it { is_expected.to validate_presence_of(:subject) }
  it { is_expected.to validate_length_of(:subject).within(1..1000) }

end
