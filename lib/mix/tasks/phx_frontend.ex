defmodule Mix.Tasks.PhxFrontend do
  use Mix.Task

  @shortdoc "Replaces default assets directory with preconfigured frontend frameworks"

  @frontends ["tailwind-vue"]

  @moduledoc """
  """

  def run([frontend]) do
    ensure_frontend_available(frontend)

    if get_confirmation(frontend) do
      remove_current_assets_directory()
      copy_frontend_assets(frontend)
      run_npm_install()
    end
  end

  defp ensure_frontend_available(frontend) do
    if unavailable(frontend) do
      Mix.raise("""
      Unknown frontend '#{frontend}'.

      Available frontends:
        - #{Enum.join(@frontends, "\n  - ")}
      """)
    end
  end

  defp get_confirmation(frontend) do
    Mix.shell().yes?("Replace assets directory with frontend '#{frontend}'.")
  end

  defp unavailable(frontend) do
    !Enum.member?(@frontends, frontend) or !File.exists?(frontend_path(frontend))
  end

  defp remove_current_assets_directory() do
    File.rm_rf!(Path.expand("./assets"))
  end

  defp copy_frontend_assets(frontend) do
    File.cp_r!(frontend_path(frontend), Path.expand("./assets"))
  end

  defp run_npm_install() do
    System.cmd("npm", ["install"], cd: "assets")
  end

  defp frontend_path(frontend) do
    Path.expand("../../../assets/#{frontend}", __DIR__)
  end
end
