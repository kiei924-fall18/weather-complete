require 'forecast_io'

class Weather
  
  def initialize(lat, long)
    ForecastIO.configure do |c|
      c.api_key = '462115257bc42b21a521817df066729d'
    end
    
    @forecast = ForecastIO.forecast(lat, long)
  end
  
  def show_report
    temp = @forecast.currently.temperature
    feels_like = @forecast.currently.apparentTemperature
    summary = @forecast.currently.summary
    
    puts "Currently, the temperature is #{temp} (feels like #{feels_like}), #{summary}"
    
    for day in @forecast.daily.data
      high = day.temperatureHigh
      low = day.temperatureLow
      summary = day.summary
      date = Time.at(day.time).strftime("%B %d, %Y")
      puts "On #{date}, we will see a high of #{high} and a low of #{low}, #{summary}"
    end
  end
  
end

puts "Kellogg"
puts "--------------------------------------"
kellogg_weather = Weather.new(42.0454106, -87.7339979)
kellogg_weather.show_report

puts
puts "NYC"
puts "--------------------------------------"
nyc_weather = Weather.new(40.6976637, -74.1197641)
nyc_weather.show_report

puts
puts "San Diego"
puts "--------------------------------------"
sd_weather = Weather.new(32.8248175,-117.3891625)
sd_weather.show_report
