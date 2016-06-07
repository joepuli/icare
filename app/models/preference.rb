class Preference
  # documents
  include Mongoid::Document
  include Mongoid::Timestamps
  include PreferenceHelper

  # associations
  belongs_to :profile
  embeds_one :behavior, cascade_callbacks: true
  embeds_one :learning, cascade_callbacks: true
  embeds_one :development, cascade_callbacks: true
  embeds_one :emotion, cascade_callbacks: true
  embeds_one :physical, cascade_callbacks: true
  has_many :risks

  # fields
  field :g, as: :gender, type: String
  field :rc, as: :racial_composition, type: String
  field :yac, as: :youngest_age_acceptable, type: String
  field :oac, as: :oldest_age_acceptable, type: String
  field :minc, as: :minimum_number_of_children, type: Integer
  field :maxc, as: :maximum_number_of_children, type: Integer
  field :lgbtq, as: :consider_LGBTQ_youth, type: Boolean, default: false

  # validations
  validates :gender, :racial_composition, :youngest_age_acceptable,
            :oldest_age_acceptable, :minimum_number_of_children,
            :maximum_number_of_children, :consider_LGBTQ_youth,
            presence: true
  validates :gender, inclusion: { in: GENDER }
  validates :racial_composition, inclusion: { in: COMPOSITION }
  validates :youngest_age_acceptable, :oldest_age_acceptable,
            inclusion: { in: ACCEPTABLE_RANGE }
  validates :minimum_number_of_children, :maximum_number_of_children,
            inclusion: { in: QUANTITY }
  validates :maximum_number_of_children,
            numericality: {
              greater_than_or_equal_to: :minimum_number_of_children
            }
  validate :oldest_cannot_be_less_than_youngest
  validates :physical, associated: true

  # nested attributes
  accepts_nested_attributes_for :physical, :emotion, :development, :learning,
                                :behavior

  # instance methods
  def oldest_cannot_be_less_than_youngest
    if oldest_age_acceptable.to_i < youngest_age_acceptable.to_i
      errors.add(:oldest_age_acceptable,
                 "can't be less than youngest age acceptable")
    end
  end
end
