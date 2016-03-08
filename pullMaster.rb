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

puts "UPDATING"


`git pull`
`ruby RollToDodge.rb`

pid = IO.popen('pidof ruby') #according to the internet, gives me back the return value
`kill #{pid}` #internet says this is how I can send a system command

`nohup ruby RollToDodge.rb` #If the above it right, then this starts the app without hanging up (no hang up) the app after the shell closes


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
