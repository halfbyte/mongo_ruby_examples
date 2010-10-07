require 'example_helper'
create_numbers

@db['numbers'].remove(
  {"$lt" => 30},
  :safe => true
)