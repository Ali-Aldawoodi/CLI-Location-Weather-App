    require 'uri'
    require 'net/http'
    require 'json'

class Weather

def fetch_weather(latitude, longitude)
    uri = URI("https://api.open-meteo.com/v1/forecast?latitude=#{latitude}&longitude=#{longitude}&current=temperature_2m&daily=temperature_2m_max,temperature_2m_min&temperature_unit=fahrenheit&wind_speed_unit=mph&precipitation_unit=inch&timezone=America%2FDenver")
    res = Net::HTTP.get_response(uri)
      weather_data = JSON.parse(res.body)
      current_temp = weather_data['current']['temperature_2m']
     
      daily_data = weather_data['daily']

    daily_forecast = {
    'time' => daily_data['time'],
    'temperature_2m_max' => daily_data['temperature_2m_max'].map { |day_data| day_data },
    'temperature_2m_min' => daily_data['temperature_2m_min'].map { |day_data| day_data }
  }
      [current_temp, daily_forecast]
  end

end
