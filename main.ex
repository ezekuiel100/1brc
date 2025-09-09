stats = Map.new()

File.stream!("data.txt")
|> Enum.map(fn line ->
  [location, temp] = String.split(line, ";")
  stats = Map.put(stats, location, temp)
  IO.inspect(stats)
end)
