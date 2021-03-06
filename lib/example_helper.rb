# This helper is included in every example to simplify the code
require 'rubygems'
###
require 'mongo'
require 'faker'

FAKE_TAGS = ['cool', 'dumb', 'foo', 'bar', 'stupid', 'weird']
begin
  @connection = Mongo::Connection.new
  @db = @connection.db("test")
rescue Mongo::ConnectionFailure => e
  puts "no default config. Might be fatal."  
end

###

#
########## Utility function
#
require 'yaml'

def load_quotes
  @db['quotes'].remove
  quotes = YAML.load_file(File.join(File.dirname(__FILE__),"..","fixtures", "quotes.yml"))
  quotes.each do |quote|
    @db['quotes'].save(quote.merge(:created_at => Time.now))
  end
end

def create_numbers(collection_name = 'numbers', count = 100)
  @db[collection_name].remove
  count.times do |i|
    @db[collection_name].insert({"i" => i})
  end
end

def create_fake_entries
  @db['people'].remove
  1000.times do
    @db['people'].insert({
      :name => Faker::Name.name,
      :address => {
        :street => Faker::Address.street_address,
        :city => Faker::Address.city,
        :zip => Faker::Address.zip_code,
        :country => "Fakistan"
      },
      :latlng => [53.593978, 10.107380],
      :tags => FAKE_TAGS.shuffle[0,2],
      :created_at => (Date.today - (rand*30).to_i).to_time
    })
  end
end