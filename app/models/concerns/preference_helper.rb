module PreferenceHelper
  # constants
  GENDER = [
    'No preference',
    'Male',
    'Female',
    'At least one male and one female'
  ].freeze

  COMPOSITION = [
    'No preference',
    'Racial composition not important',
    'Single or multiracial child',
    'Single-race child only',
    'Multiracial child only'
  ].freeze

  ACCEPTABLE_RANGE = ['infant'].push(('1'..'21').to_a).flatten.freeze

  QUANTITY = (1..12).to_a.freeze
end
