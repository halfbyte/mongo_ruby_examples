require 'example_helper'
###
100.times do |i|
  @db['numbers'].insert({"i" => i})
end

@db['numbers'].find("i" => {"$lt" => 2}).each do |row|
  puts row.inspect
end
###
# {"_id"=>$oid4bffe4396261046f25000001, "i"=>0}
# {"_id"=>$oid4bffe4396261046f25000002, "i"=>1}
