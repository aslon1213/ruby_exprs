# leetcode - #48
def rotate(matrix):
    """
    Do not return anything, modify matrix in-place instead.
    """
    matrix_2 = {}
    size = len(matrix)
    for i in range(len(matrix)):
        matrix_2[str(i)] = []
    for i in range(len(matrix)):
        for j in range(len(matrix)):
            matrix[j].insert(size,matrix[i][j])

    for i in range(size):
        matrix[i] = matrix[i][size:]

    print(matrix)
rotate([[1,2,3],[4,5,6],[7,8,9]])
            