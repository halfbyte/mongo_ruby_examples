require 'mm_helper'
create_fake_entries

person = Person.first
address = Person.first.address

puts person.inspect
puts address.inspect