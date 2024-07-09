import sys
from PyPDF2 import PdfReader, PdfWriter

def rotate_pdf(input_path, output_path):
    # Create a PDF reader object
    reader = PdfReader(input_path)
    
    # Create a PDF writer object
    writer = PdfWriter()
    
    # Iterate through all pages
    for page in reader.pages:
        # Rotate each page 90 degrees counterclockwise
        page.rotate(-90)
        
        # Add the rotated page to the writer
        writer.add_page(page)
    
    # Write the rotated PDF to the output file
    with open(output_path, "wb") as output_file:
        writer.write(output_file)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <input_pdf_path>")
        sys.exit(1)
    
    input_path = sys.argv[1]
    output_path = f"{sys.argv[1].split('.')[0]}-rotated.pdf"
    
    rotate_pdf(input_path, output_path)
    print(f"Rotated PDF saved as {output_path}")