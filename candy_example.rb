require 'example_helper'
require 'candy'

Candy.connection = @connection
Candy.db = @db

class Quote
  include Candy::Piece  
end
class Quotes
  include Candy::Collection
  collects :quote
end

quote = Quote.new
quote.from = "John 'Maddog' Hall"
quote.text = "breathtakingly expensive software"

puts Quotes.count

Quotes.each do |quote|
  puts quote.from
end

@db['Quote'].find().each do |q|
  puts q.inspect
end
