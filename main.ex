stats =
  File.stream!("data.txt")
  |> Enum.map(&String.trim/1)
  |> Enum.reject(&(&1 == ""))
  |> Enum.reduce(%{}, fn line, acc ->
    [location, temp] = String.split(line, ";")

    Map.put(acc, "#{location}", temp)
  end)

IO.inspect(stats)
