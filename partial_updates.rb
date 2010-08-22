require 'example_helper'
load_quotes

@db['quotes'].update({"from" => "Yogi Berra"}, {"$inc" => {"reads" => 1 } })
@db['quotes'].update({"from" => "Yogi Berra"}, {"$inc" => {"reads" => 1 } })

puts @db['quotes'].find_one({"from" => "Yogi Berra"}).inspect