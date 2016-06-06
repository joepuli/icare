module ParentHelper
  # constants
  GENDER_TYPE = %w(Male Female).freeze

  RACE = [
    'African American/Black',
    'American Indian/Alaskan Native',
    'Asian',
    'Pacific Islander/Native Hawaiian',
    'White/Caucasian',
    'Unable To Determine',
    'Hispanic/Latino'
  ].freeze

  PRIMARY_LANGUAGE = [
    'English',
    'American Sign Language (ASL)',
    'Spanish',
    'Russian',
    'French',
    'Chinese',
    'Vietnamese',
    'Korean',
    'Other',
    'None'
  ].freeze

  RELIGION = [
    'None',
    'Buddhist',
    'Catholic',
    'Christian',
    'Hindu',
    'Jewish',
    "Jeohvah's Witness",
    'Latter Day Saints',
    'Muslim',
    'Protestant',
    'Other'
  ].freeze

  RELATIONSHIP_STATUS = [
    'Married',
    'Single',
    'Living with partner in a committed relationship'
  ].freeze
end
