require 'uri'
    require 'net/http'
    require 'json'

    def fetch_city(name)
      encoded_name = URI.encode_www_form_component(name)
        uri = URI("https://geocoding-api.open-meteo.com/v1/search?name=#{encoded_name}&count=1&language=en&format=json")  

        res = Net::HTTP.get_response(uri)
      
        result = JSON.parse(res.body)     
          location = result['results'][0]
      
            city_name = location['name']
            latitude = location['latitude']
            longitude = location['longitude']
      

            puts "City Name: #{city_name}"
            puts "Latitude: #{latitude}"
            puts "Longitude: #{longitude}"

            [latitude, longitude]
          
      end

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

      
    def display_weather(city_name, latitude, longitude, current_temp, daily_forecast)
        puts "City Name: #{city_name}"
        puts "Latitude: #{latitude}"
        puts "Longitude: #{longitude}"
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
  
      def main
        puts "Welcome!"
         print "Enter your city: "
         city_name = gets.chomp.strip
        coordinates = fetch_city(city_name)
  
  
        if coordinates 
          latitude, longitude = coordinates
  
          current_temp, daily_forecast = fetch_weather(latitude, longitude)
  
          if current_temp && daily_forecast
            display_weather(city_name, latitude, longitude, current_temp, daily_forecast)
          end
        end
      end
      main
  
      