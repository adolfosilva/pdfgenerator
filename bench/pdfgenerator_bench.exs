defmodule PdfGeneratorBench do
  use Benchfella
  
  bench "test_generate_latex", do: PdfGenerator.test_generate_latex
end
