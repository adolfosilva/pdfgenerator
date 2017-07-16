defmodule PdfBench do
  use Benchfella
  
  bench "test_latex2", do: Pdfrender.Pdf.test_latex2
end
