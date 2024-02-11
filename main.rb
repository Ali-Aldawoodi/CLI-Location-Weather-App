require_relative 'city.rb'
require_relative 'weather.rb'
require_relative 'display.rb'

      def main
        puts "Welcome!"
         print "Enter your city: "
         city_name = gets.chomp.strip
         find_lat_and_lon = City.new
          # find_lat_and_lon.fetch_city
          coordinates = find_lat_and_lon.fetch_city(city_name)
  
  
        if coordinates 
          latitude, longitude = coordinates
          find_weather = Weather.new
          current_temp, daily_forecast = find_weather.fetch_weather(latitude, longitude)
  
          if current_temp && daily_forecast
            display = Display.new
            display.display_weather(city_name, latitude, longitude, current_temp, daily_forecast)
          end
        end
        
      end
      main
  
      