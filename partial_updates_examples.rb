require 'example_helper'
load_quotes

@db['quotes'].update({"from" => "Yogi Berra"}, {"$inc" => {"reads" => 1 } })
@db['quotes'].update({"from" => "Yogi Berra"}, {"$inc" => {"reads" => 1 } })

puts @db['quotes'].find_one({"from" => "Yogi Berra"}).inspect

create_fake_entries

puts @db['people'].find_one("tags" => {"$in" => ['cool']}).inspect

@db['people'].update(
  {"tags" => "cool"}, 
  "$addToSet" => {"tags" => 'froody'},
  :safe => true,
  :multi => true
)

@db['people'].update(
  {"tags" => "cool"},
  {
    "$addToSet" => {
      "tags" => {
        "$each" => ['froody', 'hoopy']
      }
    }
  },
  :safe => true,
  :multi => true
)

puts @db['people'].find_one({"tags" => "froody"}).inspect

@db['people'].update(
  {"tags" => "cool"},
  {"$set" => {"tags.$" => "fresh"}},
  :safe => true,
  :multi => true
)

puts @db['people'].find_one({"tags" => 'froody'}).inspect
