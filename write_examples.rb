require 'example_helper'
@db['quotes'].remove
###
doc = {
  :text => "You can observe a lot just by watching.",
  :from => "Yogi Berra",
  :created_at => Time.now
}
id = @db['quotes'].insert(doc)
#id = @db['quotes'].save(doc)

####
# doc = {
#   :text => "You can observe a lot just by watching.",
#   :from => "Yogi Berra",
#   :created_at => Time.now
# }
# id = @db['quotes'].insert(doc, :safe => true)

####
@db['quotes'].find.each do |row|
  puts row.inspect
end
####
doc = @db['quotes'].find_one(id)
doc[:from] = "Yogi Berra, famous baseball player"
@db['quotes'].save(doc, :safe => true)
###

@db['quotes'].update(
  {:_id => doc['_id']}, 
  {
    :from => "Yogi Berra",
    :text => "You can observe a lot just by watching.",
    :tags => ['baseball', 'wit']
  }
)


###

@db['quotes'].find.each do |row|
  puts row.inspect
end


