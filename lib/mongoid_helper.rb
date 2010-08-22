require 'example_helper'
require 'mongoid'

Mongoid.configure do |config|
  config.master = @db
end

class Person
  include Mongoid::Document
  field :name
  embeds  _one :address
  field :tags, :type => Array
end

class Address
  include Mongoid::Document
  field :street
  field :city
  field :country
  field :zip
end