import xml.etree.ElementTree as ET
from textwrap import dedent
import os
import re
import sys

path = sys.argv[1]
newPath = sys.argv[2]
if path == newPath:
    newPath = path+"/new/"
regex = re.compile(r'(<!--.*?-->|<[^>]*>)')

for file in os.listdir(path):
    if file.endswith(".ts"):
        newFile = open(newPath+file, "w")
        tree = ET.parse(path+file)
        root = tree.getroot()
        for item in root[0]:
            if "id" in item.attrib:
                newFile.write(item.attrib['id'])
                text = item.find('translation').text
                newFile.write(dedent(regex.sub('', text)).replace('|', ''))
        newFile.close()
