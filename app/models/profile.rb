class Profile
  include Mongoid::Document

  # associations
  belongs_to :user
  embeds_many :trainings
  embeds_many :courses
  embeds_many :preferences

  # fields
  field :first_name, type: String
  field :middle_name, type: String
  field :last_name, type: String
  field :born_on, type: Date

  # instance methods
  def full_name
    [first_name, middle_name, last_name].reject(&:blank?).join(' ')
  end
end
