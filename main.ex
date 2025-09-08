File.stream!("data.txt")
|> Enum.map(fn line -> IO.puts(line) end)
