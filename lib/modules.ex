defmodule TopLevel do
  import Logger

  defmodule Inner1 do
    def foo(), do: (info "foo")
  end

  defmodule Inner2 do
    def bar() do
      Inner1.foo()
      info "bar"
      TopLevel.Inner3.baz()
    end
  end
end

defmodule TopLevel.Inner3 do
  import Logger
  def qux() do
    TopLevel.Inner2.bar()
    info "qux"
  end

  def baz() do
    info "baz"
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
