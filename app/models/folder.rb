class Folder
  # documents
  include Mongoid::Document
  include Mongoid::Timestamps

  # association
  belongs_to :user
  belongs_to :messages, class_name: 'MessageCopy'

  # delegates
  delegate :author, :created_at, :subject, :body, :recipients, to: :message

  # intance methods
end
