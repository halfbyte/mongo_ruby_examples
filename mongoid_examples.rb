require 'example_helper'
require 'mongoid'

Mongoid.configure do |config|
  config.master = @db
end

class Quote
  include Mongoid::Document
  include Mongoid::Timestamps
  field :from
  field :text
  field :views, :type => Integer
end

load_quotes

puts "find all"
Quote.all.each do |q|
  puts q.inspect
end

puts "where clause"
Quote.where(:from => "Yogi Berra").all.each do |q|
  puts q.inspect  
end

Quote.where(:from => 'Yogi Berra').limit(5).order_by(:from.desc).all