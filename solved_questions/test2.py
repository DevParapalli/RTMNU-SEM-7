def minPartitions(used, totalCapacity):    
    total_used = sum(used)
    num_partitions = 0;
    
    for cap in sorted(totalCapacity, reverse=True):
        if total_used > 0:
            num_partitions += 1
            total_used -= cap
            
    return num_partitions

if __name__ == "__main__":
    
    # numElem = int(input())
    used = [2, 2, 3]
    totalCapacity = [3, 3, 3]
    # for _ in range(numElem):
    #     used.append(int(input()))
    
    # numElem = int(input())
    # for _ in range(numElem):
    #     totalCapacity.append(int(input()))
    print(minPartitions(used, totalCapacity))