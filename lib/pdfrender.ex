defmodule Pdfrender do
  use Export.Ruby
  use Export.Python

  @moduledoc """
  Documentation for Pdfrender.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Pdfrender.hello
      :world
  use PdfGenerator
  use Gutenex

  """
  def create_pdf(filename) do
    html = "<h1>Proposta de Projeto de Final de Curso</h1>
    <h2>Dados do Projeto</h2>
    <table>
      <tr>
        <td>Designação</td>
        <td>Gestão de Workflow dos Projetos/Estágios do IPCA</td>
      </tr>
    "
    output_path = Path.absname("/home/hedone/code/elixir/pdfrender")

    IO.puts ["Output file:", output_path]

    case PdfGenerator.generate html do
      {:ok, pdf_filepath} ->
        basename = Path.basename pdf_filepath
        IO.puts ["Basename:", basename]
        filepath = Path.join output_path, filename
        IO.puts ["filepath:", filepath]
        File.copy pdf_filepath, filepath
      {:error, reason} -> {:error, reason}
    end
  end

  def generate_pdf(filename) do
    output = Path.join "/home/hedone/code/elixir/pdfrender", filename
    IO.puts output

    {:ok, pid} = Gutenex.start_link
    |> Gutenex.begin_text
    |> Gutenex.set_font("Helvetica", 48)
    |> Gutenex.text_position(40, 180)
    |> Gutenex.text_render_mode(:fill)
    |> Gutenex.write_text("ABC")
    |> Gutenex.set_font("Courier", 32)
    |> Gutenex.text_render_mode(:stroke)
    |> Gutenex.write_text("xyz")
    |> Gutenex.end_text
    |> Gutenex.move_to(400, 20)
    |> Gutenex.export(output)
    |> Gutenex.stop

    {:ok, pid}
  end

  def test_fdf_generator do
    {:ok, ruby} = Ruby.start(ruby_lib: Path.expand("lib/ruby"))

    ruby |> Ruby.call("ruby", "fdf_generator", [])
  end

  def test_pdf_generator do
    {:ok, py} = Python.start(python_path: Path.expand("lib/python"))

    py |> Python.call("pdf", "gen_fdf", [])
    py |> Python.call("pdf", "gen_pdf", [])
  end

  def latex_generator() do
    {:ok, py} = Python.start(python_path: Path.expand("lib/python"))
    py |> Python.call("latex", "create_latex", ["template/anexo6.tex", "out/filled.tex", %{"section1"=>"Long section"}])
    {latex, 0} = System.cmd("pdflatex", ["out/filled.tex"])
  end
end
