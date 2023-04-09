#import PyPDF2
import requests
import filecmp
import pandas as pd
import shutil
import camelot
import tabula

def download_pdf(url, file_name, headers):
    #Send GET request
    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        with open(file_name, "wb") as f:
            f.write(response.content)
    else:
        print(response.status_code)

def modify_table(table, main):
    table = table.shift(1, axis=0)
    i = 0
    #table.at[table.index[0], table.columns[0]] = "HELo]"
    while(i < len(table.columns)):
        table.at[table.index[0], table.columns[i]] = table.columns[i]
        i+=1
    table.columns = main.columns
    #print(table.index)
    return table
    #for col in table.columns:

def process_text(text):
    return text.replace("Suite/Apartment", "Suite").replace("(if applicable)", "").replace("23-24 General Selection", '\033[92m' + "General" + '\033[0m').replace("3.0", '\033[92m' + "3.0" + '\033[0m').replace("23-24 Wellness Suite", '\033[0m' + "Wellness" + '\033[0m').replace("Substance", "Sub").replace("Sub Free", '\033[31m' + "Sub Free" + '\033[0m').replace("23-24", "").replace("Wellness Single", '\033[31m' + "Wellness" + '\033[0m').replace("Wellness", '\033[31m' + "Wellness" + '\033[0m').replace("Female", '\033[31m' + "Female" + '\033[0m').replace("NaN", "").replace("Unnamed: 0", "")

if __name__ == "__main__":
    hall = False
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
    tables = tabula.read_pdf('housing.pdf',pages='all')
    i = 1
    table = tables[0]
    print('\033[96m' + "done reading\n\033[0m")
    print(len(tables))
    table = tables[0]
    while(i < len(tables)):
        table = pd.concat([table, modify_table(tables[i], tables[0])])
        i+=1
        #print('\033[96m' + "concating " + str(i) + "\n\033[0m")
    
    table = table.drop('Floor', axis=1)
    if (not(hall)): table = table.drop('Building', axis=1)
    table = table.drop('Bed', axis=1)
    table = table.drop('Room', axis=1)
    #table.drop('Floor', axis=1)
    #print(table.columns)
    print(process_text(table.to_string(index=False)))
        #i += 1
    #print(tables[0])
    #print(modify_table(tables[1], tables[0]))

    if (not(filecmp.cmp(file_name, "old-" + file_name))):
        print("\n " + '\033[33m' + "**New Data Found**")
    

