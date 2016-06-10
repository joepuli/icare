FactoryGirl.define do
  factory :profile do
    primary_phone Faker::PhoneNumber.phone_number
    secondary_phone Faker::PhoneNumber.phone_number
    family_introduction Faker::Lorem.sentence
    lifestyle_and_interests Faker::Lorem.sentence
    experience_with_children Faker::Lorem.sentence
    support_network Faker::Lorem.sentence
    available_resources Faker::Lorem.sentence
  end
end
