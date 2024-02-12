# require 'uri'
# require 'net/http'
# require 'json'

# class IP_Weather

#     def fetch_ip_current()
#         uri = URI("http://api.weatherapi.com/v1/current.json?key=442c202c6cb2469897a230122241102&q=auto:ip&aqi=no
#         ")
#         res = Net::HTTP.get_response(uri)
#           ip_weather_data = JSON.parse(res.body)
#           current_ip_temp = ip_weather_data['current']['temp_f']
#       end
# end