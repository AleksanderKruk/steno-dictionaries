import pathlib
import shutil
import xml.etree.ElementTree
import html
from antlr4 import CommonTokenStream, FileStream
from bs4 import BeautifulSoup
import requests
import antlr4.xpath.XPath as XPath
from lxml import etree
import requests

if __name__ == "__main__":
    url = r"https://en.cppreference.com/w/cpp"
    html_result = requests.get(url)
    if html_result.status_code != 200:
        print(f"ERROR: {html_result.status_code}")
    soup = BeautifulSoup(html_result.content, "html.parser")
    dom = etree.HTML(str(soup))
    urls = dom.xpath(r'//div[@id="bodyContent"]//a/@href')
    size = len(urls)

    names = set()
    for i, url in enumerate(urls):
        print(f"{i} / {size}")
        url = f"https://en.cppreference.com/{url}"
        cache_file_name = url.split("/")[-1]
        cache_file_path = f"./cache/{cache_file_name}"
        cache_file = pathlib.Path(cache_file_path)

        if not cache_file.exists():
            html_result = requests.get(url)
            if html_result.status_code != 200:
                print(f"ERROR: {html_result.status_code}")
                continue
            with cache_file.open("wb") as fh:
                fh.write(html_result.content)
            content = html_result.content
        else:
            with cache_file.open("r", encoding="utf-8") as fh:
                content = fh.read()

        soup = BeautifulSoup(content, "html.parser")
        dom = etree.HTML(str(soup))
        member_names = dom.xpath(r'//*[@class="t-dsc-member-div"]//span[@class="t-lines"][1]/span/text()')
        names |= set(member_names)

    with open("./allsymbols.txt", "w", encoding="utf-8") as fh:
        fh.writelines(f"{name}\n" for name in sorted(names))







