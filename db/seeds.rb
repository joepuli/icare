Race::OPTIONS.each do |race|
  Race.find_or_create_by!(name: race)
end
