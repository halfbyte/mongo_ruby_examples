require 'example_helper'
@db.drop_collection('people')
create_fake_entries

puts @db['people'].find(
  "address.city" => /haven/
).explain.inspect

@db['people'].create_index("address.city")

puts @db['people'].find("address.city" => /haven/).explain.inspect


{
  "cursor"=>"BasicCursor", 
  "nscanned"=>1000, 
  "nscannedObjects"=>1000, 
  "n"=>39, "millis"=>2, 
  "indexBounds"=>{}, 
  "allPlans"=>[
    {"cursor"=>"BasicCursor", "indexBounds"=>{}}
  ]
}

{
  "cursor"=>"BtreeCursor address.city_1 multi", 
  "nscanned"=>1000, 
  "nscannedObjects"=>39, 
  "n"=>39, "millis"=>1, 
  "indexBounds"=>{
    "address.city"=>[["", {}], [/haven/, /haven/]]
  }, 
  "allPlans"=>[
    {
      "cursor"=>"BtreeCursor address.city_1 multi", 
      "indexBounds"=>{
        "address.city"=>[["", {}], [/haven/, /haven/]]
      }
    }
  ]
}