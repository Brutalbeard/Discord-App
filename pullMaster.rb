require "pstore"

#pid = ARGV[0]

#`kill #{pid}` #internet says this is how I can send a system command
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
  hashText = h.fetch(:hash)
end



puts "Updating 50%"
`git pull`
puts "Update Complete"
`ruby RollToDodge.rb`

`git fetch --all`
`git reset --hard origin/master`

#pid = `pgrep ruby` #according to the internet, gives me back the return value

exec 'nohup ruby RollToDodge.rb' #If the above it right, then this starts the app without hanging up (no hang up) the app after the shell closes


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
