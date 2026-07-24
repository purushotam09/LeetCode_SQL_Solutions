class Solution(object):
    def romanToInt(self, s):
        dict1 = {"I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000}
        ans = 0
        for t in range(len(s)):
            if t < len(s) - 1 and dict1[s[t]] < dict1[s[t+1]]:
                ans = ans - dict1[s[t]]
            else:
                ans = ans + dict1[s[t]]
        return ans
        