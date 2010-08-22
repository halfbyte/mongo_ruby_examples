require 'example_helper'
create_fake_entries

map = <<-END
  function() {
    this.tags.forEach(function(z) {
      emit(z, {count: 1});
    });
  }
END
reduce = <<-END
  function(key, values) {
    var total = 0;
    values.forEach(function(v) { total += v.count });
    return {count: total}
  }
END

collection = @db['people'].map_reduce(
  map, reduce
)
collection.find().sort(
  'value.count',
  :desc
).limit(10).each do |entry|
  puts entry.inspect
end
