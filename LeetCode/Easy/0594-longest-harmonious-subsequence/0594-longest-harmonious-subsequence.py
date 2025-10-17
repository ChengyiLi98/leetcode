from collections import Counter

class Solution:
    def findLHS(self, nums: List[int]) -> int:
        cnt = Counter(nums)  # Counter({2: 3, 3: 2, 1: 1, 5: 1, 7: 1})
        res = 0
        for num in cnt:
            if num + 1 in cnt:
                res = max(res, cnt[num] + cnt[num + 1])
        return res


'''
from typing import List
class Solution:
    def findLHS(self, nums: List[int]) -> int:
        nums.sort()
        left = 0
        res = 0
        for right in range(len(nums)):
            # 收缩窗口直到最大-最小 <= 1
            while nums[right] - nums[left] > 1:
                left += 1
            # 只有差==1 才是“和谐”
            if nums[right] - nums[left] == 1:
                res = max(res, right - left + 1)
        return res

'''