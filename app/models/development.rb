class Development
  # documents
  include Mongoid::Document
  include Mongoid::Timestamps
  include BehaviorHelper

  # associations
  embedded_in :preference

  # fields
  field :d, as: :hightest_level_of_development_disability_in_a_child_your_family_will_consider,
            type: String

  # validation
  validates :d, presence: true, inclusion: { in: SEVERITY }
end
