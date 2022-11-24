from random import randint
import json


def make_matrix(size):
    mat = []
    for i in range(size):
        row = []
        for j in range(size):
            row.append(randint(1, 10))
        mat.append(row)
    return mat


size = int(input("Size of matrices: "))

mat_1 = make_matrix(size)
mat_2 = make_matrix(size)


with open("AB.json", "w") as file:
    file.write(json.dumps({"A": mat_1, "B": mat_2, "size": size}))
