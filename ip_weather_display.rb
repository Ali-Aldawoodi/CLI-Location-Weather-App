require 'terminal-table'
require_relative 'ip_weather_forecast.rb'

class IP_Display

def display_ip_weather(current_ip_temp, daily_ip_forecast)
    table_rows = []
    table_rows << ['Date', 'High Temperature (°F)', 'Low Temperature (°F)']
    
    daily_ip_forecast['date'].each_with_index do |date, index|
        high_temp = daily_ip_forecast['maxtemp_f'][index]
        low_temp = daily_ip_forecast['mintemp_f'][index]
        table_rows << [date, high_temp, low_temp]
  end 

  table = Terminal::Table.new(rows: table_rows)
  ip_city = IP_Weather.new
  

    puts "Current Weather: #{ip_city.fetch_ip_city}"
    puts "Current Temperature: #{current_ip_temp} °F"

    puts "7-Day Forecast"
    puts table
  end
end