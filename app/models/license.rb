class License
  include Mongoid::Document
  include Mongoid::Timestamps

  # constants
  BOOLEAN_OPTIONS = [
    'Yes',
    'No',
    'Do not know'
  ].freeze

  # associations
  embedded_in :profile

  # fields
  field :t, as: :training_classes, type: String
  field :f, as: :been_a_foster_parent, type: Boolean
  field :c, as: :current_license, type: String
  field :lc, as: :completed_on, type: Date
  field :lu, as: :updated_on, type: Date

  # validations
  validates :training_classes, :been_a_foster_parent,
            :current_license, :completed_on, presence: true
end
