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
  hashText = h.fetch(:hash)
end


puts "Updating 50%"
`git pull`
puts "Update Complete"
`ruby RollToDodge.rb`

`git fetch --all`
`git reset --hard origin/master`

exec 'nohup ruby RollToDodge.rb' #If the above it right, then this starts the app without hanging up (no hang up) the app after the shell closes
