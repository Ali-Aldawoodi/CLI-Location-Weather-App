require 'terminal-table'

class Display

def display_weather(city_name, latitude, longitude, current_temp, daily_forecast)
    table_rows = []
    table_rows << ['Date', 'High Temperature (°F)', 'Low Temperature (°F)']
    
    daily_forecast['time'].each_with_index do |date, index|
        high_temp = daily_forecast['temperature_2m_max'][index]
        low_temp = daily_forecast['temperature_2m_min'][index]
        table_rows << [date, high_temp, low_temp]
  end 

  table = Terminal::Table.new(rows: table_rows)


    puts "Current Weather #{city_name}"
    puts "Current Temperature: #{current_temp} °F"

    puts "7-Day Forecast"
    puts table
  end
end