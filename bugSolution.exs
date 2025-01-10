```elixir
list = [1, 2, 3, 4, 5]

try do
  Enum.each(list, fn x ->
    if x == 3 do
      throw(:exit_signal)
    end
    IO.puts(x)
  end)
catch
  :exit_signal -> IO.puts("Process exited prematurely.")
end

#Alternative, safer solution using Enum.reduce
Enum.reduce(list, [], fn x, acc ->
  if x == 3 do
    acc  #Skip the rest
  else
    [x | acc]
  end
end) |> Enum.reverse |> Enum.each(&IO.puts/1)
```