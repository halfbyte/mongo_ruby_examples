require 'example_helper'
require 'mongo_mapper'


MongoMapper.setup({ 
  "development" => {
    "host" => 'localhost',
    "port" => 27017,
    "database" => 'test'
  }
}, "development")

#MongoMapper.database = "test"

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