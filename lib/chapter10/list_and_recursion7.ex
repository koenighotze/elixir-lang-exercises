defmodule Chapter10.ListAndRecursion7 do

  import ListsAndRecursion, [ 'myspan' ]

  # import Chapter10.ListAndRecursion5, [:functions]

  @doc """

  Calculates the primes in the range using the sieve of Eratosthenes

  iex> Chapter10.ListAndRecursion7.sieve(10)
  [2, 3, 5, 7]
  """
  def sieve(n) do
    all = myspan(2, n)

    non_primes = for x <- all,
                     y <- myspan(2, x),
                     y <= x/2,
                     rem(x, y) == 0, do:
                     x
                     
    all -- non_primes
  end
end
