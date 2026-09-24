# Arden

Arden receives two files, and old file and a new file, and gives you a number of how many lines your file increased by.

For example, if you write this in French Press CoffeeScript:

```
fullTime = right now in full
```

And compile it into:

```
now = new Date()
hours = now.getHours()
minutes = now.getMinutes()
seconds = now.getSeconds()
fullTime = "#{hours}:#{minutes}:#{seconds}"
```

And then run Arden on the two files:

`elixir arden.ex old.txt new.txt`

It will return:

"Your generated file is 5 lines longer than the original."

In short, Arden makes it easy to prove how much more concise your preprocessor makes things. It doesn't mean your preprocessor is 100% better, but more lines tends to mean more boilerplate.
