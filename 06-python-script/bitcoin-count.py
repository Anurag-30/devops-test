# -*- coding: utf-8 -*-
import re
import gzip

file = gzip.open('/Users/anuragp/thoughtworks-repo/personal-workspace/home-test/06-python-script/pagecounts-20160101-000000.gz', 'rt')

Lines = file.readlines() 

count = 0;

for line in Lines:
    lineList = line.split(" ")
    domain = lineList[0]
    if(domain == 'en'):
        word = lineList[1]
        if(re.search("bitcoin", word , re.IGNORECASE) != None):
            print(word,lineList[2])
            count = count + int(lineList[2])
            
print(count)