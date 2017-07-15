import subprocess
import os
from fdfgen import forge_fdf


def gen_fdf():
    fields = [('Name','John'),('Surname','Smith'),('Postcode','555-1234')]
    fdf = forge_fdf("",fields,[],[],[])
    fdf_file = open("data.fdf","wb")
    fdf_file.write(fdf)
    fdf_file.close()

def gen_pdf():
    os.system("pdftk fillable.pdf fill_form data.fdf output output.pdf flatten")
