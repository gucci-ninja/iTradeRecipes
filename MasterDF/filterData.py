import csv
import numpy

path = r'C:/Users/Ming/iTradeRecipes/MasterDF/small.csv'
with open(path, "r") as f:
    data = csv.reader(f, delimiter=",")
    next(data, None) # skip headers
    priceAmountMap = {} # Array to hold the average prices for each group of item
    stdevAmount = {}
    meanAmount = {}
    itemList = [] # keep track of Display_name
    currentItem = ""
    for row in data: 
        currentItem = row[6]
        if (currentItem == "UNKNOWN"):
            continue
        if (not (currentItem in itemList)):
            itemList.append(currentItem)
            priceAmountMap[currentItem] = []
        priceAmountMap[currentItem].append(row[8])
    for item in itemList:
        stdevAmount[item] = numpy.std(numpy.array(priceAmountMap[item]).astype(numpy.float))
        meanAmount[item] = numpy.mean(numpy.array(priceAmountMap[item]).astype(numpy.float))
    f = open("stdDevMean.txt", "w+")
    f.write("These are standard deviations:\n")
    f.write(str(stdevAmount))
    f.write("\nThese are means:\n")
    f.write(str(meanAmount))
    f.close()