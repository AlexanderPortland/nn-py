import PyPDF2
import requests
import filecmp
import shutil
import camelot

def extract_text_from_pdf(pdf_file: str):
    with open(pdf_file, 'rb') as pdf:
        reader = PyPDF2.PdfReader(pdf, strict=False)
        pdf_text = []

        for page in reader.pages:
            content = page.extract_text()
            pdf_text.append(content)

        return pdf_text
    
def download_pdf(url, file_name, headers):
    #Send GET request
    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        with open(file_name, "wb") as f:
            f.write(response.content)
    else:
        print(response.status_code)

if __name__ == "__main__":
    print('\033[96m' + "loading file...\n\033[0m")
    # Define HTTP Headers
    headers = {
        "User-Agent": "Chrome/51.0.2704.103",
    }

    # Define URL of a PDF
    url = "https://reslife.brown.edu/sites/default/files/Fall%202023%20Housing%20Selection%20Room%20List.pdf"

    # Define PDF file name
    file_name = "housing.pdf"

    shutil.copyfile(file_name, "old-" + file_name)

    # Download PDF
    download_pdf(url, file_name, headers)

    print('\033[96m' + "printing file\n\033[0m")
    extracted_text = extract_text_from_pdf('housing.pdf')
    for text in extracted_text:
        print(text)
        print("\n-----------hola-------------\n")

    if (not(filecmp.cmp(file_name, "old-" + file_name))):
        print("\n " + '\033[92m' + "**New Data Found**")
    

