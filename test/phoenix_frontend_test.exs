defmodule PhoenixFrontendTest do
  use ExUnit.Case
  doctest PhoenixFrontend

  test "greets the world" do
    assert PhoenixFrontend.hello() == :world
  end
end
