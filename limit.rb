require 'example_helper'
create_numbers

###
@db['numbers'].find.sort("i").limit(10).each do |i|
  puts i['i']
end
###
@db['numbers'].find.sort("i").limit(10).skip(50).each do |i|
  puts i['i']
end
###