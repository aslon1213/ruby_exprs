require 'pry-byebug'
#bubble sorting algorithm in ruby
def bubble_sort(array)
    not_sorted = true
    array_length = array.length
    full_iteration_count = 0
    while not_sorted
        full_iteration_count += 1
        iteration_count = 0
        for i in (0 ... (array_length - 1))
            a = array[i]
            b = array[i + 1]
            if a > b
                array[i] = b
                array[i + 1] = a
            else
                iteration_count += 1
            end
        end
        if iteration_count == array_length - 1
            not_sorted = false
        end
    end
    p "Number of full iterations: #{full_iteration_count}"
    return array
end



# a = '21 64 42 83 79 30 97 51 31 63 11 50 77 33 15 25 46 22 99 44 69 58 90 17 12 67 96 14 53 54 56 84 4 16 85 57 1 75 94 39 74 28 45 10 86 34 60 72 81 88 9 73 19 71 5 59 35 76 98 26 89 61 40 27 78 13 8 32 24 48 62 7 80 6 93 23 49 66 91 2 55 47 68 100 95 52 36 82 92 41 43 3 65 37 18 20 29 87 38 70'
# #arr = [4,3,78,2,0,2]
# arr = a.split.map {|number| number.to_i if number.is_a?(String)}
# p bubble_sort(arr)