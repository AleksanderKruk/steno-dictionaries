
from bs4 import BeautifulSoup
from lxml import etree
import requests


URL = "https://en.cppreference.com/w/cpp/header/array"

webpage = requests.get(URL)
soup = BeautifulSoup(webpage.content, "html.parser")
dom = etree.HTML(str(soup))
print(dom.xpath(r'//*[@class="t-dsc-member-div"]//span[@class="t-lines"][1]/span/text()'))