# leetcode --- 151. Reverse Words in a String
def reverseWords( s):
    """
    :type s: str
    :rtype: str
    """
    s = s.split()
    output = ""
    length = len(s)
    for i in range(length):
        output += s[-1 - i] + " "
    
    return output[:-1]





print(reverseWords("  hello world  "))