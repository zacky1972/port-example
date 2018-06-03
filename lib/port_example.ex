defmodule PortExample do
  @moduledoc """
  Documentation for PortExapmle.
  """

  @doc """

  """
  def run do
    message = "Hello!\n"
    IO.puts "Port will be opened"
    port = Port.open({:spawn_executable, "native/port_example/target/release/port_example"}, [:binary])
    IO.puts "will send command"
    Port.command(port, message)

    IO.puts "will receive"
    receive do
      {^port, {:data, result}} ->
        IO.puts(inspect result)
    end
    _ = Port.close(port)
  end
end
