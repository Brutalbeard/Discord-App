require "pstore"
#set h as variable to contain Hash
h = PStore.new("hash.pstore")
hashText = String.new("")

#Initializes pstore hash, to verify against current git hash.
h.transaction do
  if (h.fetch(:hash)=="")
  puts "Initializing"
  h[:hash] = "test"
  end
end

#Gets current Branch Hash from pstore and sets in text variable for comparison
h.transaction do
puts "In fetch:"
hashText = h.fetch(:hash)
end

#next lines for troubleshooting only.
puts "Local Hash = #{hashText}"
print "Remote hash = "
puts `git rev-parse --verify HEAD`


puts "Updating 50%"
#`git pull`
puts "Update Complete"
`ruby RollToDodge.rb`


#if (hashText != `git rev-parse --verify HEAD`)
#  print "In main:"
#  h.transaction do
#    h[:hash] = `git rev-parse --verify HEAD`
#  end
#  `git stage`
#  `git commit -m "automatic pull"`
#  `git pull --rebase`
#  `ruby RollToDodge.rb`
#end
