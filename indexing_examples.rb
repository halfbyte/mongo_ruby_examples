require 'example_helper'
begin
  # the rescue is only needed once, because dropping a non existant index
  # throws an exception
  @db['people'].drop_indexes
rescue Mongo::MongoDBError => e
end
create_fake_entries
time = Time.now
puts @db['people'].find("tags" => {"$all" => ["cool", "dumb"]}).count
puts "Time: #{Time.now - time}"
#
@db['people'].create_index("tags")
#
@db['people'].create_index(
  [["tags", Mongo::ASCENDING]]
)

#
time = Time.now
puts @db['people'].find("tags" => {"$all" => ["cool", "dumb"]}).count
puts "Time: #{Time.now - time}"

@db['people'].drop_index("tags_1")

@db['people'].create_index(
  [["latlng", Mongo::GEO2D]]
)

@db['people'].find(
  "latlng" => {"$near" => [53.593978, 10.107380]}
).each do |row|
  puts row.inspect
end