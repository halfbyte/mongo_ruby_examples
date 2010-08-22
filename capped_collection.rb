require 'example_helper'

# Creating a capped collection
@db.create_collection('capped_numbers', :capped => true, :max => 50)

# try to create a hundred numbers 
create_numbers('capped_numbers', 100)

# should output 50
puts @db['capped_numbers'].find.count