from bs4 import BeautifulSoup
import json
import requests

url = 'https://www.ianos.gr/books/epistimes/pliroforiki?product_list_limit=60'

result = requests.get(url)
soup = BeautifulSoup(result.text, "html.parser")

table = soup.findAll('a',
                     attrs={'class': 'product-item-link'},
                     href=True)

json_output = []
for row in table[:5]:
    book_url = row['href']
    request_book = requests.get(book_url)
    new_soup = BeautifulSoup(request_book.text,
                             "html.parser")
    new_table = new_soup.find('table',
                              attrs={'class': 'data table additional-attributes'})
    new_table_body = new_table.find('tbody')
    headers = [header.text
               for header in new_table_body.find_all('th')]
    d_body = [body.text
               for body in new_table_body.find_all('td')]
    book_data = {headers[n]:d_body[n] for n in range(len(d_body))}

    json_output.append(book_data)
    print(book_data['Τίτλος'])
    print(book_data)

with open("books.json", "w", encoding='utf8') as final:
    json.dump(json_output, final, ensure_ascii=False, indent=2)
