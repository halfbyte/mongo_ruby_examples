require 'example_helper'

puts "Stats: ----------------"
puts @db.stats.inspect

{
  "collections"=>4, 
  "objects"=>1011, 
  "avgObjSize"=>244.6330365974283, 
  "dataSize"=>247324, 
  "storageSize"=>345600, 
  "numExtents"=>6, 
  "indexes"=>3, 
  "indexSize"=>114688, 
  "fileSize"=>201326592, 
  "ok"=>1.0
}

@db.add_stored_function(
  "tag_size", 
  "function(obj) {return obj.tags.length}"
)
create_fake_entries
@db['people'].find(
  "$where" => 'tag_size(this) === 2'
).each do |row|
  puts row.inspect
end