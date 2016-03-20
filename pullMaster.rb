puts "Updating 50%"
`git pull`
puts "Update Complete"
`ruby RollToDodge.rb`

`git fetch --all`
`git reset --hard origin/master`

exec 'nohup ruby RollToDodge.rb' #If the above it right, then this starts the app without hanging up (no hang up) the app after the shell closes
