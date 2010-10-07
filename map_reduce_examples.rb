require 'example_helper'
create_fake_entries

map = "
  function() {
    this.tags.forEach(function(z) {
      emit(z, {count: 1});
    });
  }
"
reduce = "
  function(key, values) {
    var total = 0;
    values.forEach(function(v) { total += v.count });
    return {count: total}
  }
"

collection = @db['people'].map_reduce(
  map, reduce
)
collection.find().sort(
  'value.count',
  :desc
).limit(10).each do |entry|
  puts entry.inspect
end
