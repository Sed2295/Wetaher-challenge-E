#Este modulo ya no se uso por que todo lo pusimo en page_view
defmodule WeatherWeb.CityController do
  use WeatherWeb, :controller
  #spec nos sirve para tipar nuestras funcion con nuestras entradas y :: salida
  #@spec view_city(any(), map()) :: any()
  #def view_city(conn, %{"city" => city} = params) do
    #IO.inspect params
    #Weather.OpenWeather.get_forecast(city)
    #  |> IO.inspect
    #json(conn, %{})
  #end
  #def view_cities(conn, %{"city" => city} = params) do
    #IO.inspect params
    #Weather.OpenWeather.get_weather(city)
  #end
end
