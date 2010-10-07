require 'example_helper'
load_quotes

###
@db['quotes'].find.each do |row|
  puts row.inspect
end
###
row = @db['quotes'].find_one
puts row.inspect
###
@db['quotes'].find(:from => "Yogi Berra").each do |row|
  puts row.inspect
end
