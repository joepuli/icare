class Conversation
  # documents
  include Mongoid::Document
  include Mongoid::Timestamps

  # associations
  belongs_to :user
  has_many :messages, dependent: :destroy

  # fields
  field :s, as: :subject, type: String

  # validations
  validates :subject, presence: true
  validates :messages, associated: true

  # nested attributes
  accepts_nested_attributes_for :messages

  # delegate

  # scopes

  # instance methods
end
