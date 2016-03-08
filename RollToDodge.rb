require 'discordrb' #uber fancy and useable library

bot = Discordrb::Commands::CommandBot.new("jceloria@icloud.com", "suckit123", "/", {advanced_functionality: false}) #credentials for login, the last string is the thing you have to type to run our commands.

#bot.message(containing: "test") do |event| #obvious test message. Leaving it in here as 'message' works slightly differently from command.
#  event.respond "Your test worked- even though fletcher is in bed"
#end

bot.message(from: not!("Iblan"), containing: "Suck it Ian!") do |event| #Will probably make this cooler. You'll see.
  event.respond "#{event.author.mention} fires an arrow at Ian!"
end

bot.message(from: "Iblan", containing: "Suck it") do |event|
  even.respond "Shut up Ian."
end

bot.command(:shoot, description: "Shoots and arrow at whoever, or whatever you want", usage: "Type /shoot Ian") do |event, arg|
  "#{event.author.mention} shoots an arrow at #{arg}"
end

bot.command(:roll, description: "Returns a roll.", usage: "Type /roll 1d20 as an example") do |event, arg| # so the description and the usage are both for help. That's something the message above doesn't have. Event means, it happened I guess? Little fuzzy there. Then the 'arg' is whatever they type in after calling the command. Which runs through old faithful down below.
  if arg.match(/\d{1,}[d]\d{1,2}/) == nil
    text = "Wrong syntax. Try /help roll"
  else
    diceAmount = arg.split("d")[0].to_i
    diceType = arg.split("d")[1].to_i
    rolls = Array.new()
    text = String.new()
    text << "#{event.user.name} rolled #{diceAmount}, #{diceType} sided die...\n"
    totRoll = 0
   for i in 1..(diceAmount)
    rolls[i] = (rand(1..diceType))
    totRoll += rolls[i]
    text << "Roll #{i}: #{rolls[i]} \n"
   end
  text << "\nTotal: #{totRoll}"
  end
  text #so this also differs from the messages above. Don't have to put event.respond. That's what was causing those double responses earlier. Just put the variable adter the last 'end' which closes out the 'do' at the top. Then it sends back that variable. Boom.
end

#creating an update command that will call PullMaster.rb, wich we can put a minimum set of terminal commands to run git pull, then ruby RollToDodge to restart the Bot.
bot.command(:update, description: "Updates Bot using PullMaster.rb", usage: "Type /update") do |event|
  #event.respond "In Update #{event.author.mention}"
  if(from: not!("Anarkytt" || "BrutalBeard"))
    event.respond "Authorized user #{event.author.mention}. \n Initializing update"
    #pid = `pgrep ruby`.chomp
    exec 'ruby pullMaster.rb'
  else
    event.respond "Unauthorized user. Get hosed."
  end
end


bot.run
