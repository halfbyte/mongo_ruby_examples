require 'example_helper'
require 'mongo_mapper'

MongoMapper.connection = @connection
MongoMapper.database = "test"

class Person
  include MongoMapper::Document
  key :name
  one :address
  key :tags, Array
end

class Address
  include MongoMapper::Document
  key :street
  key :city
  key :country
  key :zip
end