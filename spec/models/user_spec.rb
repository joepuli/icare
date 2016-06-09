require 'rails_helper'

RSpec.describe User, type: :model do
  # associations
  it { is_expected.to have_one(:profile) }
  it { is_expected.to have_many(:conversations) }
end
