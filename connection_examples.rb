require 'example_helper'

@connection = Mongo::Connection.new

@connection = Mongo::Connection.new(
  'localhost', 
  27017,
  :pool_size => 5,
  :timeout => 20
)

@connection = Mongo::Connection.from_uri(
  "mongodb://localhost:27017/"
)