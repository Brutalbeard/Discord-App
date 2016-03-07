require 'discordrb'

bot = Discordrb::Commands::CommandBot.new("jceloria@icloud.com", "suckit123", "!")

#bot.message(containing: /\d{1,}[d]\d{1,2}/) do |event|
  #event.respond "The bot isn't ready you stupid idiot!"
  #end

bot.message(containing: "test") do |event|
  event.respond "Your test worked."
end

bot.message(containing: "Suck it Ian!") do |event|
  event.respond "#{event.user.name} fires an arrow at Ian!"
end

bot.command(:hi) { "Hi!" }

bot.command(:roll) {|event, arg|
  diceAmount = arg.split("d")[0].to_i
  diceType = arg.split("d")[1].to_i
  rolls = Array.new()
  text = String.new()
  totRoll = 0
  for i in 1..(diceAmount)
    rolls[i] = (rand(1..diceType))
    totRoll += rolls[i]
    text << "Roll #{i}: #{rolls[i]} \n"
  end
  text << "\nTotal: #{totRoll}"
event.respond text}

bot.run
