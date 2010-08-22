require 'example_helper'
create_fake_entries

puts @db['people'].distinct('tags').inspect
