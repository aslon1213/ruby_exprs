def check_for_palindrome(string):
    for i in range(len(string) // 2):
        if string[i] != string[-1 - i]:
            return False        
    return True
            
def longestPalindrome( s):

    if len(s) == 1:
        return s
    elif check_for_palindrome(s):
        print('ssss')
        return s
    elif len(s) == 2 and check_for_palindrome(s) == False:
        return s[0]
    
    
    longest_palindrome = ''
    for i in range(len(s)):
        starting = i
        for j in range(i,len(s)):
            ending = j
            pal = s[i:(j+1)]
            length = starting - ending
            if check_for_palindrome(pal) and len(longest_palindrome) < (j - i + 1):
                longest_palindrome = pal
    
    return longest_palindrome

print(longestPalindrome("ac"))
print(longestPalindrome("cbba"))
print(longestPalindrome('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabcaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'))
print(longestPalindrome("dsqspnkrvrhqzqvovbofdzqishgtcrvckluzpwesvartjhljqdphdupktoxdffvoqupuxmehikegjnwuheoafgqrtvuzphkikaixnjmhepeqorzjzgnrxxxirhjvboijbzftxhvtrdmbcvysxscvqmgifipwujvvktithqthujpxwwgamwqkxnnxiymtuvtyzafbxybalnjboaiyrxedviesmzzwgagilndguylskdikiocvqmjmfykakuiihuqurgqqirjoccqoixegyspftktguitqtixcsywycutcaedusndombnfzpgoklqzzqlkogpzfnbmodnsudeactucywyscxitqtiugtktfpsygexioqccojriqqgruquhiiukakyfmjmqvcoikidkslyugdnligagwzzmseivdexryiaobjnlabyxbfazytvutmyixnnxkqwmagwwxpjuhtqhtitkvvjuwpifigmqvcsxsyvcbmdrtvhxtfzbjiobvjhrixxxrngzjzroqepehmjnxiakikhpzuvtrqgfaoehuwnjgekihemxupuqovffdxotkpudhpdqjlhjtravsewpzulkcvrctghsiqzdfobvovqzqhrvrknpsqsd"))