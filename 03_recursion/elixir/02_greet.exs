defmodule Greeting do
  def greet2(name) do
    IO.puts("how are you, #{name}?")
  end

  def bye do
    IO.puts("ok bye!")
  end

  def greet(name) do
    IO.puts("hello, #{name}!")
    greet2(name)
    IO.puts("getting ready to say bye...")
    bye()
  end
end

Greeting.greet("adit")
