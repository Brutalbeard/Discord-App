require "pstore"
#set h as variable to contain Hash
h = PStore.new("hash.pstore")

if (h != `git rev-parse --verify HEAD`) do |event|
h = `git rev-parse --verify HEAD`
`git pull`
`ruby untitled.rb`
end
