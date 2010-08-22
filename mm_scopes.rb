require 'mm_helper'
create_fake_entries

class Person
  scope :tagged, lambda { |tag| where(:tags.in => [tag]) }
end

puts Person.tagged('cool').first.inspect