inp = [1, 1, 2, 2, 2, 3]

class Solution:
    def frequencySort(self, nums):
        import collections
        freq = collections.Counter(nums)
        return sorted(nums, key=lambda x: (freq[x], -x))
    
sol = Solution()
print(sol.frequencySort(inp))