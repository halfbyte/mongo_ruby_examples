require 'example_helper'

# clearing the collection
@db['numbers'].remove

before = Time.now
100.times do |i|
  @db['numbers'].insert({"i" => i})
end
puts "Inserting 100 simple items took #{Time.now - before} seconds"

@db['numbers'].find("$where" => "this.i < 2").each do |row|
  puts row.inspect
end

# {"_id"=>$oid4bffe4396261046f25000001, "i"=>0}
# {"_id"=>$oid4bffe4396261046f25000002, "i"=>1}
