import time

class Solution(object):


    def guess(self,m):
        n = 6
        if m < n:
            return 1
        elif m > n:
            return -1
        else:
            return 0


    def guessNumber(self, n):
        """
        :type n: int
        :rtype: int
        """
        m = n // 2
        print(m)
        power = 1
        output = self.guess(m)
        while output != 0:
            
            if output == -1:
                power += 1
                m -= n >> power
                output = self.guess(m)
            elif output  == 1:
                power += 1
                m += n >> power
                output = self.guess(m)
        return m

a = Solution

a.guessNumber(10,6)