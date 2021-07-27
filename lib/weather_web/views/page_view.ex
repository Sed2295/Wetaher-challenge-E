defmodule WeatherWeb.PageView do
  use WeatherWeb, :view
  use Timex
  alias Weather.OpenWeather
  def get_city(city) do
    {:ok, %{body: cuerpo}}= OpenWeather.get_forecast(city)
    %{"city" => %{"name" => name}} = cuerpo
    #IO.inspect cuerpo["list"], label: "->"
    IO.inspect name
    filtrado = Enum.filter(cuerpo["list"], fn day ->
      #IO.inspect day
      List.last(String.split(day["dt_txt"], " "))
      |> case  do
        "06:00:00" -> true
        "12:00:00" -> true
        "18:00:00" -> true
        _ -> false
      end
    end)
    #IO.inspect filtrado
    #Si necesitas dividir tu colección en pequeños grupos, chunk_every/2 es la función que
    #probablemente estás buscando:
    final = Enum.chunk_every(filtrado, 3)
    IO.inspect final
    #fechas = Enum.uniq_by(filtrado , fn day -> List.first(String.split(day["dt_txt"], " ")) end)
    #IO.inspect fechas
    final
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
    #IO.inspect Timex.now()

    #Timex.format!({2013,8,18}, "{RFC1123}")

  end
end
