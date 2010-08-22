require 'example_helper'
load_quotes

###
@db['quotes'].find.each do |row|
  puts row.inspect
end
###

@db['quotes'].find(:from => "Yogi Berra").each do |row|
  puts row.inspect
end
