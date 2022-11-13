# leetcode - #60

def make_permetutation(n,k):
    output = []
    m = 0
    if len(n) == 1:
        return ([n],1)
    elif len(n) == 2:
        return ([[n[0],n[1]],[n[1],n[0]]],2)
    elif len(n) > 2:
        for i in range(len(n)):
            latest_output, m = make_permetutation(n[:i] + n[i+1:],k) if i < len(n) - 1 else make_permetutation(n[:i],k)
            for j in range(len(latest_output)):
                output.append([n[i]] + latest_output[j])
            if len(n) == k[0]:
                k[1] += len(latest_output)
            print(len(output))
            if k[2] < k[1]:
                return output[k[2] - 1]
        
            
    return (output,m)



def getPermutation(n, k):
    nums = []
    for i in range(1,n+1):
        nums.append(str(i))
    n = 0
    perms = []
    while n < k:
        for i in range(n):
            print()  
    return 1

print(make_permetutation([1,2,3,4],[4,0,23]))