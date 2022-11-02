inp = input("Your input: ")
output = ""
for i in range(len(inp) // 2):
    num = inp[2 * i]
    ch = inp[2 * i + 1]

    for j in range(int(num)):
        output += ch

print(output)


"""

for(int i = 1; i < 6; i ++)
{
    if (i % 2 == 1)
    {
        for (int j = 0; j < (5 - i); j++)
        {
            cout << " ";
        }
        for(int k = 0; k < i; k++)
        {
            cout << "*";
        }
        cout << endl;
    }
}



"""