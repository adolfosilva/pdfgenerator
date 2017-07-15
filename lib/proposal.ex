defmodule Pdfrender.Proposal do
  import Pandex, only: [markdown_to_html: 1]
  alias Iona, as: Iona

  def get_proposal do
    path = "/home/hedone/code/elixir/pdfrender/test.html"

    title = "# Proposta de Projeto de Final de Curso"
    year = "### 2016/2017"
    section1 = "## Descrição Sumária dos Objetivos do Projeto"

    markdown = Enum.join([title, year, section1], "\n")

    case markdown_to_html markdown do
      {:ok, html} ->
        IO.puts ["Html:", html]
        File.write! path, html
    end
  end

  def get_proposal2 do
    %{title: "My Document"} |>
    Iona.template(path: "/home/hedone/code/elixir/pdfrender/template/proposal.tex.eex")
    |> IO.puts
    # Iona.write!(y, "proposal.pdf")
  end
end
