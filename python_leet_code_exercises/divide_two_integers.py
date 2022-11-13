# leetcode - #17

def get_div(dividend,divisor):
    output = 0

    while divisor <= dividend:
        dividend -= divisor
        output +=1
    return (output, dividend)

def div_algo(dividend, divisor):
    d = ""
    dividend = str(dividend)
    length = len(dividend)
    length_of_divisor = len(str(divisor))
    for i in range(length - length_of_divisor + 1):
        if dividend[0:2] == "00":
            d += "0"
            dividend = dividend[1:]
            continue
        if int(str(dividend)[0:length_of_divisor]) < divisor and len(dividend) > length_of_divisor:
            div, left = get_div(int(dividend[0:length_of_divisor + 1]),divisor)
            dividend = str(left) + dividend[length_of_divisor + 1:]
            d += str(div)
        elif int(dividend[0:length_of_divisor]) >= divisor:
            div, left = get_div(int(dividend[0:length_of_divisor]),divisor)
            dividend = str(left) + dividend[length_of_divisor:]
            d += str(div)
    return int(d)


def divide(dividend: int, divisor: int):
    lower_bound = -(2 ** 31)
    upper_bound = 2 ** 31 - 1
    case = True

    if (dividend < 0 and divisor > 0) or (dividend >0 and divisor < 0):
        case = False
    if dividend <0:
        dividend = - dividend
    if divisor <0:
        divisor = - divisor

    output = div_algo(dividend,divisor)
    return output if case else -output

print()
print()
output = divide(10,3)
print(output)
print(10// 3)
