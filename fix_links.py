import os

# List of files to process
files = [f for f in os.listdir('.') if f.endswith('.jsp')]

for f in files:
    with open(f, 'r', encoding='utf-8') as file:
        content = file.read()
    
    # Replace .html with .jsp in links
    # but avoid renaming standard libraries or external links if they happened to end in html (unlikely here)
    new_content = content.replace('.html"', '.jsp"')
    new_content = new_content.replace('.html\'', '.jsp\'')
    new_content = new_content.replace('href="index.html"', 'href="index.jsp"')
    
    # Specific verification fix for header/footer include
    # (Just in case)
    
    if new_content != content:
        print(f"Fixing links in {f}")
        with open(f, 'w', encoding='utf-8') as new_file:
            new_file.write(new_content)
