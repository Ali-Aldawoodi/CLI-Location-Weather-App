require_relative 'city.rb'
require_relative 'weather.rb'
require_relative 'display.rb'
require_relative 'ip_weather_forecast.rb'
require_relative 'ip_weather_display.rb'

      def main
        puts "Welcome!"
        print "Reply yes or no: Would you like to use your IP address to find weather information? If not, you will still be able to enter the city you want the weather for! "
        answer = gets.chomp.strip
        if answer == 'yes'
          get_ip_weather = IP_Weather.new
          current_ip_temp, daily_ip_forecast = get_ip_weather.fetch_ip_forecast

            if current_ip_temp && daily_ip_forecast
              display_ip = IP_Display.new
              display_ip.display_ip_weather(current_ip_temp, daily_ip_forecast)
            end
          
        else
         print "Enter your city: "
         city_name = gets.chomp.strip
         find_lat_and_lon = City.new('Denver', 39.73915, -104.9847)
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
      end
      main
  
      