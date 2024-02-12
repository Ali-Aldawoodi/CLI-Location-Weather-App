require 'uri'
require 'net/http'
require 'json'

class IP_Weather

    def fetch_ip_forecast()
        uri = URI("http://api.weatherapi.com/v1/forecast.json?key=442c202c6cb2469897a230122241102&q=auto:ip&days=7")
        res = Net::HTTP.get_response(uri)

          ip_weather_data = JSON.parse(res.body)
          current_ip_temp = ip_weather_data['current']['temp_f']
          

          daily_ip_date = ip_weather_data['forecast']['forecastday'].map { |day| day['date'] }
    
        daily_ip_forecast = {
        'date' => daily_ip_date,
        'maxtemp_f' => ip_weather_data['forecast']['forecastday'].map { |day| day['day']['maxtemp_f'] },
        'mintemp_f' => ip_weather_data['forecast']['forecastday'].map { |day| day['day']['mintemp_f'] }
      }
         [current_ip_temp, daily_ip_forecast]
      end

      def fetch_ip_city()
        uri = URI("http://api.weatherapi.com/v1/forecast.json?key=442c202c6cb2469897a230122241102&q=auto:ip&days=7")
        res = Net::HTTP.get_response(uri)

          ip_weather_data = JSON.parse(res.body)
          ip_city_name = ip_weather_data['location']['name']
      end

end