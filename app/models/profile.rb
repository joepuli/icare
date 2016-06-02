class Profile
  include Mongoid::Document

  # associations
  belongs_to :user
  embeds_many :trainings
  embeds_many :courses
  embeds_many :preferences
  has_one :address, as: :addressable

  # fields
  field :first_name, type: String
  field :middle_name, type: String
  field :last_name, type: String
  field :born_on, type: Date

  # nested attributes
  accepts_nested_attributes_for :trainings, :courses, :preferences,
                                reject_if: proc { |obj| obj[:name].blank? }
  accepts_nested_attributes_for :address,
                                reject_if: proc { |obj| obj[:zip].blank? }

  # delegate
  delegate :full_address, to: :address, allow_nil: true
  
  # instance methods
  def full_name
    [first_name, middle_name, last_name].reject(&:blank?).join(' ')
  end
end
