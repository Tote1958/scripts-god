#! /usr/bin/env python3
import os

try:
    import requests
except ImportError:
    os.system("pip install requests")
    os.wait()
    import requests

try:
    from bs4 import BeautifulSoup
except ImportError:
    os.system("pip install beautifulsoap4")
    os.wait()
    from bs4 import BeautifulSoup



page = requests.get('https://www.valordolarblue.com.ar/')
soup = BeautifulSoup(page.text, 'html.parser')


values = []
values_elements = soup.find_all('div', class_='value')


for value in values_elements:
    text = value.find('strong').text
    values.append(text)

dolar_blue_compra = values[0]
dolar_blue_venta = values[1]
print(f'El valor del dolar blue de hoy es: \nCompra: {dolar_blue_compra} \nVenta: {dolar_blue_venta} \nAlberto la re concha de tu madre')