
# there should probably be some sort of verification here
[oldFile, newFile] = case System.argv() do
  [oldFile, newFile] ->
    [oldFile, newFile]
  _ ->
    IO.puts("Please provide your old file and the generated file as the first and second arguments.")
    System.stop()
end

read_file_contents = fn file ->
  case File.read(file) do
    {:ok, contents} ->
      contents
    {:error, :enoent} ->
      IO.puts("The given file: #{file} does not exist in this context.")
      System.stop()
    {:error, reason} ->
      IO.puts("Something went wrong while trying to read #{file}: #{reason}")
      System.stop()
  end
end


oldFileLength = read_file_contents.(oldFile)
|> String.split("\n")
|> Enum.count()

newFileLength = read_file_contents.(newFile)
|> String.split("\n")
|> Enum.count()

difference = newFileLength - oldFileLength


if difference < 0 do
  IO.puts("Your generated file is somehow shorter than the original by #{abs(difference)} lines.")
else
  IO.puts("Your generated file is #{difference} lines longer than the original.")
end
