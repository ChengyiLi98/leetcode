'''
class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        counts = {}  # 用字典保存每个数出现的次数
        for num in nums:
            counts[num] = counts.get(num, 0) + 1  # 如果没出现过就从0开始加1

            # 如果当前数的次数已经超过 n/2，直接返回
            if counts[num] > len(nums) // 2:
                return num
'''
# Boyer–Moore majority vote algorithm
class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        candidate = None
        count = 0
        for num in nums:
            if count == 0:
                candidate = num
                count = 1
            elif num == candidate:
                count += 1
            else:
                count -= 1
        return candidate
