require 'example_helper'
create_fake_entries
###
puts "sorting!"
@db['people'].find().sort("address.street").limit(10).each do |d|
  puts d['address']['street']
end
puts "reverse!"
@db['people'].find().sort("address.street", :asc).limit(10).each do |d|
  puts d['address']['street']
end
@db['people'].find().sort(
  "address.street",
  Mongo::ASCENDING
).limit(10).each do |d|
  puts d['address']['street']
end


###