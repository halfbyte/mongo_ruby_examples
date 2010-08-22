require 'mongoid_helper'

person = Person.first
address = Person.first.address

puts person.inspect
puts address.inspect