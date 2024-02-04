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