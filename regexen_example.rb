require 'example_helper'

load_quotes

@db['quotes'].find({:from => /^Yogi/}).each do |row|
  puts row.inspect
end

# {"_id"=>$oid4bffe4396261046f25000001, "i"=>0}
# {"_id"=>$oid4bffe4396261046f25000002, "i"=>1}
