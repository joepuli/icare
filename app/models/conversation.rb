class Conversation
  # documents
  include Mongoid::Document
  include Mongoid::Timestamps

  # associations
  has_many :messages

  # fields
  # field :s, as: :subject, type: String

  # validations
  # validates :subject, presence: true,
  #                     length: { minimum: 1, maximum: 1000 }

  # instance methods

  # def receipts
  #   Message.in(id: messages.pluck(:message_id))
  # end
end
