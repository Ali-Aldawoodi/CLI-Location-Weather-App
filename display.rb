class Display

def display_weather(city_name, latitude, longitude, current_temp, daily_forecast)
    puts "Current Weather #{city_name}"
    puts "Current Temperature: #{current_temp} °F"

    puts "7-Day Forecast"
    dates = daily_forecast["time"]
    
    daily_forecast['time'].each_with_index do |date, index|
      puts "Date: #{date}"
      puts "High Temperature: #{daily_forecast['temperature_2m_max'][index]} °F"
      puts "Low Temperature: #{daily_forecast['temperature_2m_min'][index]} °F"
  
  end
  end

end