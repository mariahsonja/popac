[
    "Albania", "Andorra", "Armenia", "Austria", "Azerbaijan", "Belarus", "Belgium", "Bosnia and Herzegovina",
    "Bulgaria", "Croatia", "Cyprus", "Czech Republic", "Denmark", "Estonia", "Finland", "France",
    "Georgia", "Germany", "Greece", "Hungary", "Iceland", "Ireland", "Italy", "Kazakhstan", "Kosovo",
    "Latvia", "Liechtenstein", "Lithuania", "Luxembourg", "Macedonia (FYROM)", "Malta", "Moldova",
    "Monaco", "Montenegro", "Netherlands", "Norway", "Poland", "Portugal", "Romania", "Russia", "San Marino",
    "Serbia", "Slovakia", "Slovenia", "Spain", "Sweden", "Switzerland", "Turkey", "Ukraine", "United Kingdom (UK)"
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