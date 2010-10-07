require 'example_helper'
#@connection = Mongo::Connection.new('localhost', 27017)

system('mongo -p 27017 init_replicaset.js')
###
@connection = Mongo::Connection.multi([['localhost', 27017], ['localhost', 27018], ['localhost', 27019]])
###
@db = @connection.db('test')

@db.collection('foo').remove

collection = @db.collection('foo')

20.times do |i|
  collection.save({name: "dataset #{i}", value: i})
end
100.times do |i|
  puts collection.find_one(value: i % 20).inspect
end