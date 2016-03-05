require 'discordrb'

bot = Discordrb::Bot.new "jceloria@icloud.com", "suckit123"

bot.message(containing: /\d{1,}[d]\d{1,2}/) do |event|
  event.respond "The bot isn't ready you stupid idiot!"
end

bot.message(containing: "test") do |event|
  event.respond "Your test worked."
end

bot.run