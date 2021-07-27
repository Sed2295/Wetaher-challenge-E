defmodule WeatherWeb.PageView do
  use WeatherWeb, :view
  use Timex
  alias Weather.OpenWeather
  def get_city(city) do
    {:ok, %{body: body}}= OpenWeather.get_forecast(city)
    %{"city" => %{"name" => name}} = body
    #IO.inspect body["list"], label: "->"
    IO.inspect name
    filterByHour = Enum.filter(body["list"], fn day ->
      #IO.inspect day
      List.last(String.split(day["dt_txt"], " "))
      |> case  do
        "06:00:00" -> true
        "12:00:00" -> true
        "18:00:00" -> true
        _ -> false
      end
    end)
    #IO.inspect filterByHour
    #Si necesitas dividir tu colección en pequeños grupos, chunk_every/2 es la función que
    #probablemente estás buscando:
    #solo 3 horas(6,12 y 18hrs) por día
    #Order by day
    IO.inspect Enum.chunk_every(filterByHour, 3)
  end
  def get_cities(city) do
    {:ok, %{body: body}} = OpenWeather.get_weather(city)
    #IO.inspect body, label: "->"
    #IO.inspect body["name"]
    %{
      "name" => body["name"],
      "humidity" => get_in(body, ["main", "humidity"]),
      "temp" => get_in(body, ["main", "temp"]),
      "wind" => get_in(body, ["wind", "speed"])
    }
  end
  def get_day(day) do
    List.first(day)
    |> Map.get("dt_txt")
    |> String.split(" ")
    |> List.first
    |> parse_day()
  end
  def parse_day(date) do
    {:ok, result} = Timex.parse(date, "{ISOdate}")
    Timex.format!(result, "{WDfull}, {D} {Mshort} {YYYY} {Z}")
  end
end
