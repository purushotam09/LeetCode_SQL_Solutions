class Solution(object):
    def isValid(self, s):
        dict1 = { ")":"(" , "}":"{",  "]":"[" }
        stack = []
        for t in s:
            if t in "[{(" :
                stack.append(t)
            else:
                if not stack:
                    return False
                top = stack.pop()
                if top != dict1[t]:
                    return False
        return len(stack)==0
        