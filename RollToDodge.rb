grequire 'discordrb' #uber fancy and useable library
require 'json'
require 'open-uri'
require 'pstore'

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
  "#{event.author.mention} shoots an arrow at #{arg} for #{rand(1..8)} damage!"
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

#Functional remote update from github. No redundancy though. If github re-write crashes on startup, have to remote into the RPi and restart manually using
#cd Discord\ App
#nohup ruby RollToDodge.rb
bot.command(:update, description: "Updates Bot from Github remotely", usage: "Type /update") do |event|
  authUsers = [150283399192510464, 143886187122262017]
  event.respond "Beginning Update #{event.author.mention}"
  if(authUsers.include? event.user.id)
    event.respond "Authorized user #{event.author.mention}. \n Initializing update"
    exec 'ruby pullMaster.rb'
  else
    "Unauthorized user. Get hosed biatch."
  end
end

bot.command(:define, description: "Defines a word using Urban Dictionary", usage: "/define chode") {|event, arg|

  def parse(string)
    val = JSON.parse(string)
    puts "After Parse: #{val}"
    val
    rescue
      "No Definition Found"
  end

  def get_uri(uri)
    val = open(uri).read
    puts "Value Returned By URI: #{val}"
    val
  end

  def urbandictionary_uri(arg)
    "http://api.urbandictionary.com/v0/define?term=#{arg}"
  end

  event << "#{arg.capitalize}: \n"
  #event << parse(open("http://api.urbandictionary.com/v0/define?term=#{arg}").read)['definition']
  event << parse(get_uri(urbandictionary_uri(arg)))['list'].first['definition']}

bot.command(:whoami) do |event|
  event.respond "User Name: #{event.user.name}\n"
  event.respond "#{event.user.status}\n"
  event.respond "User ID: #{event.user.id}\n"
  if event.user.voice_channel != nil
    event.respond "Talking in: #{event.user.voice_channel}"
  end
  if event.user.game != nil
    event.respond "Playing: #{event.user.game}"
  end
end

bot.command(:whois) do |event, arg|
  target = arg[2...arg.length]
  event.respond "User Name: #{target.name} (ID: #{target})\n"
  event.respond "#{target.status}\n"
  #event.respond "User ID: #{event.user.id}\n"
  if event.user.voice_channel != nil
    event.respond "Talking in: #{target.voice_channel.name}"
  end
  if event.user.game != nil
    event.respond "Playing: #{target.game}"
  end

#set Tom up with Appendages so we can remove them!
appendages = Pstore.new(appendages.pstore)
appendages.transaction do
  appendages.[:arms] = ["left","right"]
  appendages.[:legs] = ["left","right","middle"]
end
bot.command(:lop) do |event|
    event. respond "Tom lost an arm!"
end

bot.run
