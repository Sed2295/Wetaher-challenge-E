defmodule Weather.OpenWeather do
  use Tesla
  plug Tesla.Middleware.BaseUrl, "https://api.openweathermap.org/data/2.5/"
  plug Tesla.Middleware.JSON

  #regresamos todo el mapa con la informacion
  def get_weather(city) do
    api = System.get_env("API_KEY")
    city = URI.encode(city)
    get("weather?q=#{city}&units=metric&appid=#{api}")
  end

  def get_forecast(city) do
    api = System.get_env("API_KEY")
    IO.inspect api
    city = URI.encode(city)
    get("forecast?q=#{city}&units=metric&appid=#{api}")
  end
end
#Forecast
#https://api.openweathermap.org/data/2.5/forecast?q=Buenos Aires,ar&units=metric&appid=455fde1c7e835780be24c20c008a06f9
#Weather
#https://api.openweathermap.org/data/2.5/weather?q=Buenos aires, ar&units=metric&appid=455fde1c7e835780be24c20c008a06f9
