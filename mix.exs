defmodule Pdfrender.Mixfile do
  use Mix.Project

  def project do
    [app: :pdfrender,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger, :pdf_generator, :gutenex, :mustache,
                          :pandex, :iona, :export, :bbmustache]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:bbmustache, "~> 1.4.0"},
     {:mustache, "~> 0.0.2"},
     {:pdf_generator, "~> 0.3.5"},
     {:gutenex, "~> 0.2.0"},
     {:pandex, "~> 0.1.0"},
     {:iona, "~> 0.2"},
     {:export, "~> 0.0.7"},
     {:erlport, github: "hdima/erlport", manager: :make},
     {:benchfella, "~> 0.3.0"}]
  end
end
