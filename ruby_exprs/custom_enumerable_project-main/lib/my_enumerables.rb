module Enumerable
  # Your code goes here

  # my_all? method
  def my_all?
    a = 0
    # iterating through all elements in self and performing block on each of these
    for el in self
      b = yield el
      b = b ? 1 : 0
      a += b
    end
    return a == self.length
  end

  #when any element matches the condition
  #returns true
  #when no element matches the condition
  #returns false
  def my_any?
    for el in self
      if yield el
        return true
      end
    end
    return false
  end

  # method for counting the length of Enumerable
  def my_count
    if block_given?
      a = 0
      # iterating through all elements in self and performing block on each of these
      for el in self
        b = yield el
        b = b ? 1 : 0
        a += b
      end
      return a
    else
      return self.length
    end
  end

#when given a block
#returns the original enumerable
#executes the block for each element and index
  def my_each_with_index
    return self unless block_given?
    for i in (0...(self.length))
      yield(self[i],i)
    end
    return self
  end

  # reduces an enumerable to a single value (FAILED - 1)
  #   can be used to calculate the product (FAILED - 2)
  #   uses the initial value on the first iteration (FAILED - 3)
  def my_inject(initial_value)
    
    output = initial_value

    for el in self
      output = yield(output,el)
    end
    return output
  end

  def my_map(&my_block)
    output = []
    if block_given?
      if !my_block
        for el in self
          if yield(el)
            output << yield(el)
          end
        end
      else
        for el in self
          output << my_block.call(el)
        end
      end
    else
      for el in self
        output << el
      end
    end
    p output
    return output
  end
  
  def my_none?
    output = 0
    for el in self
      if yield(el)
        return false
      end
    end
    return true
  end

  def my_select
    output = []
    for el in self
      a = yield(el)
      if a
        output << el
      end
    end
    #p output
    return output
  end




end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array


  def initialize
    @my_each_results = []
    @my_each = []
  end

  def my_each
    return to_enum(:my_each) unless block_given?

    for el in self do
      yield el
    end
    self
  end
end
