defmodule DistBackJobTest do
  use ExUnit.Case
  doctest DistBackJob

  test "greets the world" do
    assert DistBackJob.hello() == :world
  end
end
