require 'discordrb'

bot = Discordrb::Bot.new "jceloria@icloud.com", "suckit123"

bot.message(from: "BrutalBeard", containing: /\d{1,}[d]\d{1,2}/) do |event|
  event.respond "Is a stupid idiot!"
end

bot.run