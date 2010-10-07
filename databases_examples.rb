require 'example_helper'

puts @connection.database_info.inspect

puts @connection.database_names.inspect
#=> ["admin", "local"]


@db = @connection['test']

@db = @connection.db('test')