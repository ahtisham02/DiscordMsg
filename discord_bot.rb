require 'discordrb'

bot = Discordrb::Bot.new(token: "MTEyMDczNTY0MzU0MzI4MTY4OA.Grqsyb.G91kvYnblW26LBqDwfzJrNSwMVPMiz8C3Z3QTk")

channel_id = '549281623154229250/1011287060251942923'

bot.run do
  channel = bot.channel(channel_id)
  messages = channel.history(10)

  messages.each do |message|
    puts message.content
  end
end
