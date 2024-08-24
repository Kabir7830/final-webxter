# templatetags/custom_filters.py
from django import template
import markdown
from django.utils.safestring import mark_safe
from markdown.extensions.codehilite import CodeHiliteExtension
from markdown.extensions.extra import ExtraExtension
from django.template import Template, Context

register = template.Library()

@register.filter
def subtract_one(value):
    return value - 1

@register.filter
def divisible_by_3(value):
    if ((value%3) == 0):
        return True
    return False
@register.filter
def divisible_by_3_g4(value):
    if ((value-1)%3 == 0) and ((value-1)>3):
        return True
    return False

@register.filter(name='is_digit')
def is_digit(value):
    return value.isdigit()

@register.filter
def eval_val(value):
    return eval(value)

@register.filter
def con_int(value):
    return (int(value))

@register.filter
def custom_range(value):
    return range(value)


@register.filter
def add_one(value):
    return (int(value)+1)

@register.filter
def multiply(value, arg):
    return value * arg

@register.filter
def grt_then(value, arg):
    return (value>arg)

@register.filter
def subtract(value,arg):
    return value - arg

@register.filter
def filter_by_category(queryset, category_name):
    return queryset.filter(category=category_name)

@register.filter
def filter_featured(queryset):
    return queryset.filter(is_featured=True)

@register.filter
def filter_by_tags(queryset,tag):
    return queryset.filter(tags__icontains = tag)

@register.filter
def filter_by_category_and_range(queryset,args):
    category_name , range = args.split(',')
    range = int(range)
    queryset = queryset.filter(category__name = category_name)
    if range>0:
        queryset = queryset[:range]

    return queryset


@register.simple_tag
def render_markdown(file_path):
    try:
        with open(file_path, 'r') as file:
            markdown_content = file.read()
        html_content = markdown.markdown(markdown_content)
        return mark_safe(html_content)
    except FileNotFoundError:
        return mark_safe("<p>File not found.</p>")
    

# @register.filter(name='render_markdown_file')
# def render_markdown_file(file):
#     with file.open('r') as f:
#         content = f.read()
#         extensions = [CodeHiliteExtension(linenums=False, guess_lang=True),
#                 ExtraExtension(),'fenced_code']
#         return markdown.markdown(content, extensions=extensions)


# @register.filter(name='render_markdown_file')
# def render_markdown_file(file):
#     try:
#         with file.open('r') as f:
#             content = f.read()
#             md = markdown.Markdown(extensions=[
#                 CodeHiliteExtension(linenums=False, guess_lang=True),
#                 ExtraExtension(),
#                 'fenced_code'
#             ])
#             return md.convert(content)
#     except Exception as e:
#         return f"Error rendering Markdown file: {e}"

# @register.filter(name='render_markdown_file')
# def render_markdown_file(file, context_data):
#     with file.open('r') as f:
#         content = f.read()

#         # Render the content as a Django template with context
#         template = Template(content)
#         context = Context(context_data)
#         rendered_content = template.render(context)

#         # Now render the Markdown with the rendered content
#         extensions = ['extra', 'codehilite', 'fenced_code']
#         return mark_safe(markdown.markdown(rendered_content, extensions=extensions))

@register.filter(name='render_markdown_file')
def render_markdown_file(file, context_data):
    with file.open('r') as f:
        content = f.read()

        # Render the content as a Django template with context
        template = Template(content)
        context = Context({'course': context_data})
        rendered_content = template.render(context)

        # Debugging: Print the rendered content to the console or log
        print(rendered_content)

        # Now render the Markdown with the rendered content
        extensions = ['extra', 'codehilite', 'fenced_code']
        return mark_safe(markdown.markdown(rendered_content, extensions=extensions))