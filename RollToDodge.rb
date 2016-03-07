require 'discordrb' #uber fancy and useable library

bot = Discordrb::Commands::CommandBot.new("jceloria@icloud.com", "suckit123", "/", {advanced_functionality: false}) #credentials for login, the last string is the thing you have to type to run our commands.
# Turned off advanced_functionality above so that passing @username doesn't fail when being sent back
bot.message(containing: "test") do |event| #obvious test message. Leaving it in here as 'message' works slightly differently from command.
  event.respond "Your test worked."
end

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
  if arg.to_i > 0
    text = "#{event.author.mention} rolled a #{arg} sided die for... \n #{rand 1..arg.to_i}"
  elsif arg.match(/\d{1,}[d]\d{1,2}/) == nil
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

bot.run
