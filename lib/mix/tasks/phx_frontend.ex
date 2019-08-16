defmodule Mix.Tasks.PhxFrontend do
  use Mix.Task

  @shortdoc "Replaces assets directory with preconfigured frontend frameworks"

  @moduledoc """

  """

  def run([directory]) do
    remove_current_assets_directory()
    copy_frontend_assets(directory)
    run_npm_install()
  end

  defp remove_current_assets_directory() do
    File.rm_rf!(Path.expand("./assets"))
  end

  defp copy_frontend_assets(directory) do
    File.cp_r!(Path.expand("../../../assets/#{directory}", __DIR__), Path.expand("./assets"))
  end

  defp run_npm_install() do
    System.cmd("npm", ["install"], cd: "assets")
  end
end
