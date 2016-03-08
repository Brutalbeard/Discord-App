require "pstore"
#set h as variable to contain Hash
h = PStore.new("hash.pstore")
hashText = String.new("")
h.transaction do
  if (h.fetch(:hash)=="")
  puts "Initializing"
  h[:hash] = "test"
  end
end

h.transaction do
puts "In fetch:"
hashText = h.fetch(:hash)
end

puts hashText
puts "h = #{h}"
puts "hash = "
puts `git rev-parse --verify HEAD`
if (hashText != `git rev-parse --verify HEAD`)
  print "In main:"
  h.transaction do
    h[:hash] = `git rev-parse --verify HEAD`
  end
  `git stage`
  `git commit -m "automatic pull"`
  `git pull --rebase`
  `ruby RollToDodge.rb`
end
