stats =
  File.stream!("data.txt")
  |> Enum.map(&String.trim/1)
  |> Enum.reject(&(&1 == ""))
  |> Enum.reduce(%{}, fn line, acc ->
    [location, temp] = String.split(line, ";")
    {temp, _} = Float.parse(temp)

    if acc[location] do
      value = Map.get(acc, location)

      maxValue = value[:max]
      minValue = value[:min]

      max = max(temp, maxValue)
      min = min(temp, minValue)

      newValue = [
        sum: Float.round(value[:sum] + temp, 2),
        max: Float.round(max),
        min: Float.round(min),
        count: value[:count] + 1
      ]

      Map.put(acc, "#{location}", newValue)
    else
      Map.put(acc, "#{location}", sum: temp, max: temp, min: temp, count: 1)
    end
  end)

IO.inspect(stats)
