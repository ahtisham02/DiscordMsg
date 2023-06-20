require 'net/http'
require 'json'
# please add your Bearer Token and Channel Id.
channel_id = '1120750830153384007/1120750830153384010'
token = 'MTEyMDczNTY0MzU0MzI4MTY4OA.Grqsyb.G91kvYnblW26LBqDwfzJrNSwMVPMiz8C3Z3QTk'

url = URI.parse("https://discord.com/channels/#{channel_id}/messages")
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url.request_uri)
request['Authorization'] = "Bearer #{token}"
request['User-Agent'] = 'DiscordBot'

response = http.request(request)

puts response
if response.code == '200'
  messages = JSON.parse(response.body)
  messages.each do |message|
    puts message['content']
  end
else
  puts "Error: #{response.code} - #{response.message}"
end
