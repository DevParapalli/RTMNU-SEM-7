import pymupdf
import sys

def split_pdf_pages(input_file, output_file):
    src = pymupdf.open(input_file)
    doc = pymupdf.open()  # empty output PDF

    for spage in src:  # for each page in input
        spage.set_rotation(0)  # reset rotation
        r = spage.rect  # input page rectangle
        d = pymupdf.Rect(spage.cropbox_position,  # CropBox displacement if not
                      spage.cropbox_position)  # starting at (0, 0)
        
        # Split the page into left and right parts
        r_left = pymupdf.Rect(r.x0, r.y0, r.x1, r.y1/2)  # left half
        r_right = pymupdf.Rect(r.x0, r.y1/2, r.x1, r.y1)  # right half
        rect_list = [r_left, r_right]

        for rx in rect_list:  # run through rect list
            rx += d  # add the CropBox displacement
            page = doc.new_page(-1,  # new output page with rx dimensions
                               width = rx.width,
                               height = rx.height)
            page.show_pdf_page(
                    page.rect,  # fill all new page with the image
                    src,  # input document
                    spage.number,  # input page number
                    clip = rx,  # which part to use of input page
                )

    # Save output file
    doc.save(output_file,
             garbage=3,  # eliminate duplicate objects
             deflate=False,  # compress stuff where possible
    )

# Usage


input_file = sys.argv[1]
output_file = f"{sys.argv[1].split('.')[0]}-split.pdf"
split_pdf_pages(input_file, output_file)