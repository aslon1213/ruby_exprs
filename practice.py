def couples(inp):
    stack = []
    for i in inp:
        if len(stack) == 0:
            stack.append(i)
            continue
        if i == "(":
            stack.append(i)
        elif i == ")" and stack[-1] == "(":
            stack.pop()
        elif i == ")" and stack[-1] == ")":
            stack.append(i)
    print(stack)
    return True if len(stack) == 0 else False


print(couples(")()"))
