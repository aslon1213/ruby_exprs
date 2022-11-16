# leetcode - #263

import math
class Solution:
    def prime_factor(self,num):  
        factors = []
        # Using the while loop, we will print the number of two's that divide n  
        while num % 2 == 0:  
            factors.append(2)
            num = num / 2  
    
        for i in range(3, int(math.sqrt(num)) + 1, 2):  
    
            # while i divides n , print i ad divide n  
            while num % i == 0:  
                factors.append(int(i))
                num = num / i  
        if num > 2:  
            factors.append(int(num))
        return factors


            
    def isUgly(self, n: int):
        if n == 1:
            return True
        if n <= 0:
            return False
        prime_factors = list(set(self.prime_factor(n)))
        print(prime_factors)
        if len(prime_factors) > 3:
            return False
        else:
            for i in prime_factors:
                if i != 2 and i != 3 and i != 5:
                    return False
        return True

a= Solution()
print(a.isUgly( 214797179))
