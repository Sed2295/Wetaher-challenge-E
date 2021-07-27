defmodule WeatherWeb.PageController do
  use WeatherWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
  def forecast(conn, %{"ciudad" => city} = params) do
    #IO.puts city
    render(conn, "forecast.html",city: city)
  end
end
