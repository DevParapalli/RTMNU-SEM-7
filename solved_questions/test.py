def minPartitions(used, totalCapacity):
    n = len(used)
    
    # Sort partitions by used space in descending order
    partitions = sorted(zip(used, totalCapacity), reverse=True)
    
    usedSpace = 0
    numPartitions = 0
    
    for usedCap, totalCap in partitions:
        if usedSpace + usedCap <= totalCap:
            usedSpace += usedCap
        else:
            numPartitions += 1
            usedSpace = usedCap
    
    # If any data is left, we need an additional partition
    if usedSpace > 0:
        numPartitions += 1
    
    return numPartitions

if __name__ == "__main__":
    
    numElem = int(input())
    used = []
    totalCapacity = []
    for _ in range(numElem):
        used.append(int(input()))
    
    numElem = int(input())
    for _ in range(numElem):
        totalCapacity.append(int(input()))
    print(minPartitions(used, totalCapacity))