require 'example_helper'
create_fake_entries

###
@db['people'].find(
  :tags => {
    "$in" => ['cool', 'weird']
  }
).each do |doc|
  puts doc.inspect
end

###
obj = {
  "_id"=>BSON::ObjectID('4c706af16261040680000369'), 
  "name"=>"Vernon Kreiger", 
  "address"=>{
    "street"=>"536 Haleigh Locks", 
    "city"=>"Port Kiannahaven", 
    "zip"=>"80730-0214", 
    "country"=>"Fakistan"
  }, 
  "tags"=>["cool", "weird"]
}
###

@db['people'].find("address.city" => "Berlin").each do |doc|
  puts doc.inspect
end

###

@db['people'].find("address.city" => /haven/).each do |doc|
  puts doc.inspect
end