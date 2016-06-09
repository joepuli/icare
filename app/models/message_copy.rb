class Message
  # documents
  include Mongoid::Document
  include Mongoid::Timestamps

  # association
  belongs_to :message
  belongs_to :recipient, class_name: 'User'
  belongs_to :folder

  # delegates
  delegate :author, :created_at, :subject, :body, :recipients, to: :message

  # intance methods
end
