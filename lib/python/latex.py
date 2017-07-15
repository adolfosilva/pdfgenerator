import jinja2
import os
from jinja2 import Template


def create_latex(template_path, outpath, data):
    latex_jinja_env = jinja2.Environment(
        block_start_string='\BLOCK{',
        block_end_string='}',
        variable_start_string='\VAR{',
        variable_end_string='}',
        comment_start_string='\#{',
        comment_end_string='}',
        line_statement_prefix='%%',
        line_comment_prefix='%#',
        trim_blocks=True,
        autoescape=False,
        loader=jinja2.FileSystemLoader(os.path.abspath('.')))
    template = latex_jinja_env.get_template(template_path)
    latex_file = template.render(data)
    print(latex_file)
    with open(outpath, "w") as f:
        f.write(latex_file)


if __name__ == '__main__':
    create_latex("template.tex", "../../final.tex")
