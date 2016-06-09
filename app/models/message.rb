class Message
  # documents
  include Mongoid::Document
  include Mongoid::Timestamps

  # attributes
  attr_accessor :to

  # association
  belongs_to :conversation
  belongs_to :to, class_name: 'User', inverse_of: :receiver
  belongs_to :from, class_name: 'User', inverse_of: :sender

  # fields
  field :s, as: :subject, type: String
  field :b, as: :body, type: String

  # validations
  validates :to, :from, presence: true

  # nested attributes
  accepts_nested_attributes_for :conversation

  # intance methods
  # def recipients
  #   User.in(id: message_copies.pluck(:message_copy_id))
  # end
  #
  # def prepare_copies
  #   return if to.blank?
  #
  #   to.each do |recipient|
  #     recipient = User.find(recipient)
  #     message_copies.build(recipient_id: recipient.id, folder_id: recipient.inbox.id)
  #   end
  # end
end
