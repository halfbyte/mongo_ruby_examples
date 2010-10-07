require 'example_helper'
###

create_numbers

puts @db['quotes'].find_one("from" => 'Yogi Berra').inspect

puts "simple -----------------"
@db['numbers'].find("i" => {"$lt" => 2}).each do |row|
  puts row.inspect
end
puts "not --------------------"
@db['numbers'].find(
  "i" => {
    "$not" => {"$lt" => 97}
  }
).each do |row|
  puts row.inspect
end
puts "and --------------------"
@db['numbers'].find(
  "i" => {
    "$lt" => 52, 
    "$gt" => 48
  }
).each do |row|
  puts row.inspect
end
puts "or ---------------------"

@db['numbers'].find(
  "$or" => [
    {
      "i" => { "$lt" => 2 }
    },
    {
      "i" => { "$gt" => 97 }
    }
  ]
).each do |row|
  puts row.inspect
end

###
# {"_id"=>$oid4bffe4396261046f25000001, "i"=>0}
# {"_id"=>$oid4bffe4396261046f25000002, "i"=>1}
