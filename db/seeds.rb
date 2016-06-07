Race::OPTIONS.each do |race|
  Race.find_or_create_by!(name: race)
end

Risk::FACTORS.each do |risk|
  Risk.find_or_create_by!(name: risk)
end
