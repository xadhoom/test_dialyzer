defmodule TestDialyzerTest do
  use ExUnit.Case
  doctest TestDialyzer

  test "greets the world" do
    assert TestDialyzer.hello() == :world
  end
end
