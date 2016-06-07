class Parent
  # documents
  include Mongoid::Document
  include Mongoid::Timestamps
  include ParentHelper

  # associations
  embedded_in :profile
  has_many :races

  # fields
  field :fn, as: :first_name, type: String
  field :mn, as: :middle_name, type: String
  field :ln, as: :last_name, type: String
  field :dob, as: :date_of_birth, type: Date
  field :g, as: :gender, type: String
  field :re, as: :religion, type: String
  field :pl, as: :primary_language, type: String
  field :sl, as: :secondary_language, type: String
  field :md, as: :active_or_reserve_duty_military, type: Boolean, default: false
  field :o, as: :occupation, type: String
  field :rs, as: :relationship_status, type: String

  # validations
  validates :first_name, :last_name, :date_of_birth, :gender,
            :active_or_reserve_duty_military, :primary_language,
            :relationship_status, :religion, presence: true

  validates :gender, inclusion: { in: GENDER }
  validates :primary_language, inclusion: { in: LANGUAGE }
  validates :religion, inclusion: { in: RELIGION }
  validates :relationship_status, inclusion: { in: RELATIONSHIP_STATUS }

  # nested attribtes
  accepts_nested_attributes_for :races
end
