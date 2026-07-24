class Solution(object):
    def isPalindrome(self, x):
        s = str(x)
        rs = s[::-1]
        if s == rs :
            return True
        else :
            return False
        