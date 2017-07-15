require 'pdf_forms'

def fdf_generator
	fdf = PdfForms::Fdf.new :key => 'value', :other_key => 'other value'
	# use to_pdf_data if you just want the fdf data, without writing it to a file
	puts fdf.to_pdf_data
end

def dev_null(&block)
  begin
    orig_stdout = $stdout.dup # does a dup2() internally
    $stdout.reopen('/dev/null', 'w')
    yield
  ensure
    $stdout.reopen(orig_stdout)
  end
end

def generate_pdf
	fdf = PdfForms::Fdf.new :key => 'value', :other_key => 'other value'
   #fdf.save_to "data.fdf"
   system("pdftk fillable.pdf fill_form data.fdf output output.pdf flatten")
end
