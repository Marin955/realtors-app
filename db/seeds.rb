require 'csv'
require 'set'

csv_file_path = File.join(__dir__, 'realtors.csv')

realtors_csv_data = CSV.read(csv_file_path, headers: true).map(&:to_h)

# Using a Set to quickly identify duplicates in the CSV file.
# Hash keys are first_name, last_name and brokerage concatenated
unique_identifiers = Set.new

# Final realtors collection used for storing to DB
unique_realtors = []

realtors_csv_data.each do |row|
  unique_key = [row["First Name"], row["Last Name"], row["Brokerage"]].join("|")
  next if unique_identifiers.include?(unique_key)

  unique_identifiers.add(unique_key)
  
  unique_realtors << {
    first_name: row["First Name"],
    last_name: row["Last Name"],
    brokerage: row["Brokerage"],
    zipcode: row["Zipcode"],
    image_url: row["image_url"]
  }
end

# No validations, so insert_all can be used for optimized insert
Realtor.insert_all(unique_realtors)
