require 'pry-byebug'

def stock_picker(arr)
    output = [0,0]
    max_now = 0
    arr.each_with_index do |number, index|
        slice = arr.slice(index, arr.length - index -1 )
        slice.each_with_index do |num, i|
            
            if num > number && num - number > max_now
                max_now = num - number
                output[0] = index
                output[1] = i + index 
            end        
        end
    end
    #binding.pry    
    return output
end

# arr = [17,3,6,9,15,8,6,1,10,17,3,6,9,15,8,6,1,10]
# output =  stock_picker(arr)
# p output
# p arr[output[0]].to_s + ":" + arr[output[1]].to_s + "   ||   differrence is #{arr[output[1]] - arr[output[0]]}"