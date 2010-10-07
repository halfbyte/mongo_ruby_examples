require 'example_helper'
create_fake_entries

reduce = "
///
  function(doc, prev) {
    for(i in doc.tags) {
      if (doc.tags[i] in prev.tags) {
        prev.tags[doc.tags[i]]++
      } else {
        prev.tags[doc.tags[i]] =1
      }
    }
  }
///
"

finalize = "
///
  function(prev) {
    var mostPopular = 0; 
    for(i in prev.tags) {
      if(prev.tags[i] > mostPopular) {
        prev.tag = i; 
        prev.count = prev.tags[i];
        mostPopular = prev.tags[i];
      }
    } 
    delete prev.tags
  }
///
"

# "tags" => {
#   "foo" => 11.0, 
#   "dumb" => 12.0, 
#   "stupid" => 7.0, 
#   "bar" => 7.0, 
#   "cool" => 14.0, 
#   "weird" => 17.0
# }

###
@db['people'].group(
  ['created_at'],
  {},
  {:tags => {}},
  reduce,
  finalize
).each do |row|
  puts row.inspect
end