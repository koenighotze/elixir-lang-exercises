defmodule TopLevel do
  defmodule Inner1 do
    def foo(), do: (IO.puts "foo")
  end

  defmodule Inner2 do
    def bar() do
      Inner1.foo()
      IO.puts "bar"
      TopLevel.Inner3.baz()
    end
  end
end

defmodule TopLevel.Inner3 do
  def qux() do
    TopLevel.Inner2.bar()
    IO.puts "qux"
  end

  def baz() do
    IO.puts "baz"
  end

end

defmodule TopLevel.Attrs do
  @val 3
  def val(), do: @val
end


defmodule TopLevel.Importer do
  import TopLevel.Inner3, only: [  qux: 0  ] 
  # import TopLevel.Inner3, [ :functions ]

  def useTheImport(), do: ( qux() )
end
