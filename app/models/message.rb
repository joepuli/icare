class Message
  # documents
  include Mongoid::Document
  include Mongoid::Timestamps

  # attr_accessor :to_id, :from_id

  # association
  belongs_to :conversation
  belongs_to :to, class_name: 'User'
  belongs_to :from, class_name: 'User'

  # fields
  field :b, as: :body, type: String

  # validations
  validates :to_id, :from_id, :body, presence: true

  # nested attributes

  # intance methods
end
