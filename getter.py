import pathlib
import xml.etree.ElementTree
import html
from bs4 import BeautifulSoup
import requests
import lxml.html

if __name__ == "__main__":
    url = r"https://en.cppreference.com/w/cpp/header/array"
    html = requests.get(url)
    if html.status_code != 200:
        print(f"ERROR: {html.status_code}")
    cache_file_name = url.split("/")[-1]
    cache_file = pathlib.Path(f"./cache/{cache_file_name}")
    if not cache_file.exists():
        with cache_file.open("wb") as fh:
            fh.write(html.content)
    tree = lxml.html.etree.parse(str(cache_file))
    soup = BeautifulSoup(html.content, "html.parser")

    # Konwersja do formatu obsługiwanego przez XPath (etree)
    dom = etree.HTML(str(soup))
    member_names = tree.findall(r'//*[@class="t-dsc-member-div"]//span[@class="t-lines"][1]/span/text()')

    for name in member_names:
        print(name)







