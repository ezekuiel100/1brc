stats =
  File.stream!("data.txt")
  |> Enum.map(&String.trim/1)
  |> Enum.reject(&(&1 == ""))
  |> Enum.reduce(%{}, fn line, acc ->
    [location, temp] = String.split(line, ";")

    if acc[location] do
      value = Map.get(acc, location)
      newValue = [max: temp, min: temp, count: value[:count] + 1]
      Map.put(acc, "#{location}", newValue)
    else
      Map.put(acc, "#{location}", max: temp, min: temp, count: 1)
    end
  end)

IO.inspect(stats)
