# Good Sets

## Problem Description

You are given a string S consisting of lowercase and uppercase Latin letters. Find the maximum possible number of elements in set X, where X is the set of indices from S that satisfy the following conditions:

1. The chosen set of indices must be all distinct and lowercase Latin letters.
2. The chosen set of indices should not have any uppercase letters present between them in the original string S.

## Input Format

The first line contains a string S, denoting the given string.

## Constraints

- 1 <= len(S) <= 10^5

## Sample Test Cases

### Case 1
Input: `ABCEF`
Output: `0`
Explanation: S = "ABC". There are no lowercase Latin letters. Hence, the answer for this case is equal to 0.

### Case 2
Input: `zACaAbbaazzC`
Output: `3`
Explanation: S = "zACaAbbaazzC". One of the possible set of indexes X can have are 7, 8 and 11 which satisfy the given conditions. Hence, the maximum possible elements that X can have is equal to 3.

### Case 3
Input: `aaaaBaabAbA`
Output: `2`
Explanation: S = "aaaaBaabAbA". One of the possible set of indexes X can have are 6, 8 or the positions 6 and 7, which satisfy the given conditions as positions 6 and 7 contain letters 'a', position 8 contains letter 'b'. Hence, the maximum possible elements that X can have is equal to 2.

## Implementation

The solution should be implemented in Python 3. The main structure of the code is provided:

```python
import sys

def findMaxElements(S):
    # Write your code here

def main():
    S = sys.stdin.readline().strip('\n')
    result = findMaxElements(S)
    print(result)

if __name__ == "__main__":
    main()
```

Your task is to implement the `findMaxElements` function to solve the problem.