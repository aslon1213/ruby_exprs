def calculate( s):
    """
    :type s: str
    :rtype: int
    """
    higher_order = [42,47]
    lower_order = [43,45]
    m = [42,43,45,47]
    stack = ["("]
    expression = []
    s += ")"
    index = 0
    while True:
        print(stack)
        if index >=len(s):
            break
        i = s[index]
        e = ord(i)
        if e == 32:
            index += 1
            continue
        if e >=48 and e <= 57:
            num = ""
            num += s[index]
            while ord(s[index + 1]) >=48 and ord(s[index + 1]) <=57:
                num += s[index + 1]
                index += 1
            expression += [num]
            index += 1
        elif e == 41:
            while stack[-1] != "(":
                expression += [stack.pop()]
            stack.pop()
            index += 1
        elif e == 40:
            stack.append("(")
            index += 1
        elif e in m:
            if stack[-1] == "(":
                stack.append(i)
            elif e in higher_order:
                if ord(stack[-1]) in higher_order:
                    print("XXX")
                    expression += [stack.pop()]
                stack.append(i)
            elif e in lower_order:
                while ord(stack[-1]) == 42 or ord(stack[-1]) == 47:
                    expression += [stack.pop()]
                if stack[-1] != "(":
                    expression += [stack.pop()]
                stack.append(i)
            index += 1
    stack = []
    print(expression)
    for i in expression:

        try:
            e = int(i)
        except:
            e = i
        if type(e) == int:
            stack.append(int(i))
        else:
            e = ord(e)
            a = stack.pop()
            b= stack.pop()
            if e == 42:
                output = b * a
            elif e == 47:
                output = int(b / a)
            elif e== 43:
                output = b + a
            elif e == 45:
                output = b - a 
            stack.append(output)
    return stack[0]


print(calculate("14/3*2"))