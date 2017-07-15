defmodule Pdfrender.Pdf do
   alias Mustache, as: Mustache
   alias :bbmustache, as: Bbmustache

   def latex, do: latex <<"./template/test.mustache">>
   def latex(template_path) do
      name = "João Castro"
      number = "25785"
      typee = "estágio"
      variables = %{nome: name, numero: number, tipo: typee}

      template = Bbmustache.parse_file template_path
      # IO.puts template

      rendered = Bbmustache.compile(template, variables)
      IO.puts rendered

      # {latex, 0} = System.cmd("pdflatex", ["filled.tex"])
   end

   def latex2(vars), do: latex2 "template/anexo6.mustache", "out/anexo6.tex", vars
   def latex2(template_path, output_path, vars) do
      {:ok, template } = File.read template_path
      rendered = Mustache.render template, vars
      File.write! output_path, rendered
      # {latex, 0} = System.cmd("pdflatex", [output_path])
   end
   
   def test_latex2, do: latex2 %{nome: "Rita Ferreira", numero: 10203, tipo: "projeto"}
end
