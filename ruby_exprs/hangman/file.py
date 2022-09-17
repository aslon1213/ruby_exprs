def make_slice(string):
    slices = []
    if len(string) %2 == 0:
        for i in range(len(string)// 2):
            slices.append(string[2*i:2*i+2])
    else:
         for i in range(len(string)// 2):
            slices.append(string[2*i:2*i+2])
         slices.append(string[-1])
    return slices

def romanToInt(self, s):
    """
    :type s: str
    :rtype: int
    """
    roman_hash = {
    "I":1,
    "V":5,
    "X":10,
    "L":50,
    "C":100,
    "D":500,
    "M":1000,
    "CM":900,
    "CD":400,
    "XL":40,
    "XC":90,
    'IV':4,
    "IX":9,
    }
    array = []
    for i in s:
        array.append(i)
    array_2 = []
    array_3 = []
    for i in range(len(array)):
        if i < (len(array) - 1) and array[i] == 'C' and (array[i + 1] == 'D' or array[i + 1] == 'M'):
            array_2.append(array[i] + array[i + 1])            
            array_3.append(i)
            array_3.append(i+1)

        elif i < (len(array) - 1) and array[i] == 'X' and (array[i + 1] == 'L' or array[i + 1] == 'C'):
            array_2.append(array[i] + array[i + 1])
            array_3.append(i)
            array_3.append(i+1)

        elif i < (len(array) - 1) and array[i] == 'I' and (array[i + 1] == 'V' or array[i + 1] == 'X'):
            array_2.append(array[i] + array[i + 1])
            array_3.append(i)
            array_3.append(i+1)
    output = 0
    for i in array_3:
        array[i] = False
    for i in array_2:
        output += roman_hash[i]
    for i in array:
        if i:
            output += roman_hash[i]    
    return output

            
            
    
romanToInt("CDMIX")