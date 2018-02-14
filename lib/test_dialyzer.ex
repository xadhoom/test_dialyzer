defmodule TestDialyzer do
  @moduledoc false

  def with_else do
    my_ext_var = :outer_scope

    with :ok <- ok_or_error(),
         :ok <- ok_or_other_error() do
      :ok
    else
      :error ->
        foo(fn -> my_ext_var end)
        :error

      :other_error ->
        :other_error
    end
  end

  @spec ok_or_error() :: :ok | :error
  defp ok_or_error do
    Enum.random([:ok, :error])
  end

  @spec ok_or_other_error() :: :ok | :other_error
  defp ok_or_other_error do
    Enum.random([:ok, :other_error])
  end

  defp foo(fun) do
    fun.()
  end
end
