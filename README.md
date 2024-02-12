# CLI-Location-Weather-App
User will be able either use their IP address or enter a city name and then get that cities current temperature, as well as a 7-day forecast of current temperatures and the highs and lows. The data will be displayed in table format in the console. 

# Gems
Install 'terminal-table'

# API Reference

# Get weather
  GET "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m&daily=temperature_2m_max,temperature_2m_min&temperature_unit=fahrenheit&wind_speed_unit=mph&precipitation_unit=inch&timezone=America%2FDenver?
Parameter	Type	Description
name	string	Retrieves city weather data

# Get city
  GET "https://geocoding-api.open-meteo.com/v1/search?name=Berlin&count=1&language=en&format=json"
Parameter	Type	Description
latitude & longitude	string	Retrieves city

# Get IP address weather
GET "http://api.weatherapi.com/v1/forecast.json?key=442c202c6cb2469897a230122241102&q=auto:ip&days=7"
Parameter	Type	Description
auto:ip	integer	Retrieves city weather information based on IP address


# Deployment
To deploy this project run

  ruby main.rb
