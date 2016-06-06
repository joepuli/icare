class Parent
  # documents
  include Mongoid::Document
  include Mongoid::Timestamps
  include ParentHelper

  # associations
  embedded_in :profile

  # fields
  field :fn, as: :first_name, type: String
  field :mn, as: :middle_name, type: String
  field :ln, as: :last_name, type: String
  field :dob, as: :date_of_birth, type: Date
  field :g, as: :gender, type: String
  field :ra, as: :race, type: Array
  field :re, as: :religion, type: String
  field :pl, as: :primary_language, type: String
  field :sl, as: :secondary_language, type: String
  field :md, as: :active_or_reserve_duty_military, type: Boolean, default: false
  field :o, as: :occupation, type: String
  field :rs, as: :relationship_status, type: String

  # validations
  validates :first_name, :last_name, :date_of_birth, :gender, :race,
            :active_or_reserve_duty_military, :primary_language,
            :relationship_status, presence: true

  validates :gender, inclusion: { in: GENDER_TYPE }
  validates :race, inclusion: { in: RACE }
  validates :primary_language, inclusion: { in: PRIMARY_LANGUAGE }
  validates :religion, inclusion: { in: RELIGION }, allow_nil: true
  validates :relationship_status, inclusion: { in: RELATIONSHIP_STATUS }
end
