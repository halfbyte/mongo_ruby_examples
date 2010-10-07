require 'example_helper'

@collection = @db['books']

@collection = @db.collection('books')

@collection = @db['books.reviews']
@collection = @db['books']['reviews']

