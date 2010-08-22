require 'example_helper'

#######################
################## Grid

grid = Mongo::Grid.new(@db)

id = grid.put("You can put Strings in here", :filename => 'test.txt')

file = grid.get(id)
puts file.filename
puts file.read

grid.delete(id)

id = grid.put(File.open("/Users/jankrutisch/Dropbox/Photos/IMGP8989.jpg"))
grid.delete(id)

#######################
################ GridFS

fs = Mongo::GridFileSystem.new(@db)

fs.open("test.txt", "w") do |f|
  f.write "You can put stuff in here"
end

fs.open("test.txt", "r") do |f|
  puts f.read
end

fs.delete("test.txt")