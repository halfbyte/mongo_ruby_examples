require 'example_helper'
begin
  # the rescue is only needed once, because dropping a non existant index
  # throws an exception
  @db['people'].drop_index("tags_1")
rescue Mongo::MongoDBError => e
end
create_fake_entries
time = Time.now
puts @db['people'].find("tags" => {"$all" => ["cool", "dumb"]}).count
puts "Time: #{Time.now - time}"
#
@db['people'].create_index("tags")
#
time = Time.now
puts @db['people'].find("tags" => {"$all" => ["cool", "dumb"]}).count
puts "Time: #{Time.now - time}"
