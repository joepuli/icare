class Emotion
  # documents
  include Mongoid::Document
  include Mongoid::Timestamps
  include BehaviorHelper

  # associations
  embedded_in :preference

  # fields
  field :e, as: :hightest_level_of_emotional_disability_in_a_child_your_family_will_consider,
            type: String

  # validation
  validates :e, presence: true, inclusion: { in: SEVERITY }
end
