def merge_two_lists(left,right)
    left_index = 0
    right_index = 0
    another = []
    while left_index < left.length and right_index < right.length
        if left[left_index] <= right[right_index]
            another << left[left_index]
            left_index += 1
        elsif left[left_index] > right_index[right_index]
            another << right[right_index]
            right_index += 1
        end
    end
    if left_index < left.length
        another += left[left_index...left.length]
    end
    if right_index < right.length
        another += right[right_index ... right.length]
    end
    return another
end

    

def merge_sort(arr)
    if arr.length <= 1
        return arr
    end
    mid = (arr.length / 2).floor
    left = merge_sort(arr[0...mid])
    right = merge_sort(arr[mid..arr.length])
    merge_two_lists(left, right)
end

p merge_sort([1,5,7,3,2,4,2,2,2,2,200,100,101])
