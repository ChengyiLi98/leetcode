
'''
class Solution:
    def repeatedSubstringPattern(self, s: str) -> bool:
        doubled = s + s              # 步骤1：拼接自身
        trimmed = doubled[1:-1]      # 步骤2：去掉首尾各一个字符
        result = s in trimmed        # 步骤3：判断 s 是否在中间出现
        return result                # 步骤4：返回结果
        
        #return s in (s + s)[1:-1]

    因为如果 s 是由重复子串构成的，比如 s = "abab" = "ab" + "ab"，
    那 s+s = "abababab"，中间一定会“对齐”出原 字符串的位置。
    但如果s不是重复出来的，比如 "aba"，你把它拼成 "abaaba"，中间掐头去尾后就不会出现原字符串了。
    '''
class Solution:
    def repeatedSubstringPattern(self, s: str) -> bool:
        for i in range(1, len(s)):
            substring = s[0:i]

            possible = True
            for j in range(0, len(s), i): # 内层循环：每次取一段长度为 i 的片段比较
                if substring != s[j:j+i]:
                    possible = False
                    break
            
            if possible:
                return True
        
        return False
