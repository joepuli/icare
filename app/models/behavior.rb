class Behavior
  # documents
  include Mongoid::Document
  include Mongoid::Timestamps
  include BehaviorHelper

  # associations
  embedded_in :preference

  # fields
  field :b, as: :highest_level_of_behavior_issue_your_family_will_consider,
            type: String

  # validations
  validates :b, presence: true, inclusion: { in: SEVERITY }
end
