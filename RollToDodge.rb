require 'discordrb'

bot = Discordrb::Bot.new "jceloria@icloud.com", "suckit123"

bot.message(containing: "Devon") do |event|
  event.respond "Is a stupid idiot!"
end

bot.run