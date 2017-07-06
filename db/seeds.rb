[
    "Brazil",
    "Ireland"
].each do |country_name|
    puts "Creating Country #{country_name}"
    Country.where(name: country_name).first_or_create!
end

[
    "Child",
    "Refugees",
].each do |interest_name|
    Interest.where(name: interest_name).first_or_create
end