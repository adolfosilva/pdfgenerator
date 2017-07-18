defmodule PdfGenerator do
  @moduledoc """
  Módulo de geração de documentos LaTeX.
  """

  alias Mustache, as: Mustache

  @doc """
  Gera um documento LaTeX a partir de um template em Mustache.

  Retorna `:ok`.

  ## Examples

    iex> PdfGenerator.generate_latex("templates/anexo6.mustache", "out/anexo6.tex", %{nome: "Rita Ferreira"})
    :ok

  """
  def generate_latex(template_path, output_path, vars) do
    {:ok, template } = File.read template_path
    rendered = Mustache.render template, vars
    File.write! output_path, rendered
    # {latex, 0} = System.cmd("pdflatex", [output_path])
  end

  def test_generate_latex do
    vars = %{nome: "Rita Ferreira", numero: 10203, tipo: "projeto"}
    generate_latex "template/anexo6.mustache", "out/anexo6.tex", vars
  end
end
