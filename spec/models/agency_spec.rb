require 'rails_helper'

RSpec.describe Agency, type: :model do
  let(:agency) { build(:agency) }
  # include documents
  it { is_expected.to be_timestamped_document }
  it { is_expected.to be_timestamped_document.with(:created) }
  it { is_expected.to be_timestamped_document.with(:updated) }

  # associations
  it { is_expected.to belong_to(:profile) }
  it { is_expected.to embed_one(:address) }

  # nested attributes
  it { is_expected.to accept_nested_attributes_for(:address) }

  # fields
  it { is_expected.to have_field(:cpn).with_alias(:contact_person) }
  it { is_expected.to have_field(:an).with_alias(:agency_name) }
  it { is_expected.to have_field(:ap).with_alias(:agency_phone) }
  it { is_expected.to have_field(:af).with_alias(:agency_fax) }
  it { is_expected.to have_field(:cpp).with_alias(:contact_person_phone) }
  it { is_expected.to have_field(:cpe).with_alias(:contact_person_email) }
  it { is_expected.to have_field(:ccpe).with_alias(:confirm_contact_person_email) }

  # validations
  it { is_expected.to validate_presence_of(:contact_person) }
  it { is_expected.to validate_presence_of(:agency_name) }
  it { is_expected.to validate_associated(:address) }
  it { is_expected.to validate_presence_of(:agency_phone) }
  it { is_expected.to validate_presence_of(:contact_person_phone) }
  it { is_expected.to validate_presence_of(:contact_person_email) }
  it { is_expected.to validate_presence_of(:confirm_contact_person_email) }
  it 'validate #email_equals_confirm_email' do
    agency.contact_person_email = 'hello@world.com'
    agency.confirm_contact_person_email = 'world@world.com'
    agency.valid?
    expect(agency.errors.full_messages).to \
      include "Confirm contact person email must equal contact person email"
  end
end
