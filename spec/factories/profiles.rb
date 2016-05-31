FactoryGirl.define do
  factory :profile do
    first_name Faker::Name.first_name
    middle_name ''
    last_name Faker::Name.last_name
    born_on 35.years.ago
  end
end
