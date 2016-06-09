class Profile
  include Mongoid::Document
  include Mongoid::Timestamps

  # associations
  belongs_to :user
  embeds_one :license, cascade_callbacks: true
  embeds_one :home, cascade_callbacks: true
  embeds_many :parents, cascade_callbacks: true
  embeds_many :children, cascade_callbacks: true
  has_one :agency
  has_one :preference
  has_one :address, as: :addressable

  # fields
  field :p1, as: :primary_phone, type: String
  field :p2, as: :secondary_phone, type: String
  field :fi, as: :family_introduction, type: String
  field :li, as: :lifestyle_and_interests, type: String
  field :ec, as: :experience_with_children, type: String
  field :sn, as: :support_network, type: String
  field :ar, as: :available_resources, type: String

  # nested attributes
  accepts_nested_attributes_for :license, :parents, :children, :home

  # validations
  validates :primary_phone, :family_introduction,
            :lifestyle_and_interests, :experience_with_children,
            presence: true
  validates :family_introduction, :lifestyle_and_interests,
            length: { maximum: 3000 }
  validates :experience_with_children,
            length: { maximum: 3000 }
  validates :support_network, :available_resources,
            length: { maximum: 3000 }, allow_nil: true
  validates :parents, :children, :home, :license, associated: true

  # nested attributes
  accepts_nested_attributes_for :parents, :children, :home, :license,
                                allow_destroy: true
end
