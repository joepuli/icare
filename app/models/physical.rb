class Physical
  # documents
  include Mongoid::Document
  include Mongoid::Timestamps
  include BehaviorHelper

  # associations
  embedded_in :preference

  # fields
  field :p, as: :hightest_level_of_physical_or_medical_disability_in_a_child_your_family_will_consider,
            type: String

  # validation
  validates :p, presence: true, inclusion: { in: SEVERITY }
end
