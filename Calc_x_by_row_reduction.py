from black import out
import generate_matrix
import json
import sympy as sym
import numpy as np


def lu_factorization(A):
    # source: https://johnfoster.pge.utexas.edu/numerical-methods-book/LinearAlgebra_LU.html
    # Get the number of rows
    n = A.shape[0]
    U = A.copy()
    L = np.eye(n, dtype=np.double)
    # Loop over rows
    for i in range(n):
        factor = U[i + 1 :, i] / U[i, i]
        L[i + 1 :, i] = factor
        U[i + 1 :] -= factor[:, np.newaxis] * U[i]
    return L, U


def row_reduction(A):
    size = len(A)
    for i in range(size):
        for j in range(size):
            if i != j:
                temp = A[j][i] / A[i][i]
                for k in range(2 * size):
                    A[j][k] -= A[i][k] * temp
    for i in range(size):
        temp = A[i][i]
        for j in range(size * 2):
            A[i][j] = A[i][j] / temp
    output = []
    for i in range(size):
        A[i] = A[i][size : (size * 2)]
    return A


def make_inverse_of_A(A):
    output = []
    row_size = len(A)

    # make augmented matrix by adding I(n)
    for i in range(row_size):
        a = A[i]
        for j in range(row_size):
            if i != j:
                a.append(0)
            else:
                a.append(1)

    # row reduction
    B = row_reduction(A)
    return B


def calculate_multiplication(A, B, size):
    output = []
    for row in A:
        o = []
        for i in range(size):
            column = []
            for j in range(size):
                column.append(B[j][i])
            val = 0
            for j in range(size):
                val += row[j] * column[j]
            o.append(val)
        output.append(o)

    return output


def print_matrix(ffff):
    for f in ffff:
        output = "| "
        for j in f:
            output += str(j) + " "
        output += "|"
        print(output)


with open("AB.json", "r") as file:
    AB = json.load(file)
    # A = [[3, 4], [5, 6]]
    # B = [[7,7],[11,11]]
    A = AB["A"]
    B = AB["B"]
    print("Matrix A")
    print_matrix(A)
    print("Matrix B")
    print_matrix(B)
    print("Matrix X")
    A = make_inverse_of_A(A)
    L, U = lu_factorization(np.array(A, dtype="float"))
    X = calculate_multiplication(A, B, len(B))
    print_matrix(X)
    with open("X.json", "w") as outputfile:
        outputfile.write(json.dumps({"X": X}))


# A = [[3, 4], [5, 6]]
# B = [[1,1],[1,1]]

# print(calculate_multiplication(A,B,2))
