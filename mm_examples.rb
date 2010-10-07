require 'example_helper'
require 'mongo_mapper'

MongoMapper.connection = @connection
MongoMapper.database = "test"

class Quote  
  include MongoMapper::Document
  key :from
  key :text
  key :views, Integer
  timestamps!
end

load_quotes

Quote.where(:from => 'Yogi Berra').all

Quote.where(:from => 'Yogi Berra').limit(5).sort(:from.desc).all

Quote.all.each do |q|
  puts q.inspect
end
