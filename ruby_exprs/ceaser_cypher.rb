#require 'pry-byebug'
def decrypt_cease_cipher(string, n)
  # upcase letters in ascii are from 65 to 90
  #lowcase letters in ascii are from 97 to 122

  #convert letters to ASCII
  arr = string.bytes
  #binding.pry
  #loop through and shift each ASCII character by n
  arr = arr.map do |num|
    #for lowercase letters, on bound
    if num < 91 && num > 64 && (num - n) < 65
      num = num - n + 90 - 64
    #for uppercase letters, on bound
    elsif num < 123 && num > 96 && (num - n) < 96
      num = num - n + 122 - 96
    elsif num > 64 && num < 91 || num < 123 && num > 96
      num = num - n
    end
    # character is not a letter it is not shifted
    num
  end
  #binding.pry
  #reconverting from ASCII to chars and joining the list in to string
  arr = arr.map {|val| val.chr}.join
end


def ceaser_cipher(string, n)
  # upcase letters in ascii are from 65 to 90
  #lowcase letters in ascii are from 97 to 122

  #convert letters to ASCII
  arr = string.bytes
  #binding.pry
  #loop through and shift each ASCII character by n
  arr = arr.map do |num|
    #for lowercase letters, on bound
    if num < 91 && num > 64 && (num + n) > 90
      num = num + n - 90 + 64
    #for uppercase letters, on bound
    elsif num < 123 && num > 96 && (num + n) > 122
      num = num + n - 122 + 96
    elsif num > 64 && num < 91 || num < 123 && num > 96
      num = num + n
    end
    # character is not a letter it is not shifted
    num
  end
  #binding.pry
  #reconverting from ASCII to chars and joining the list in to string
  arr = arr.map {|val| val.chr}.join
end





# print 'What is Your message: '
# message = gets.chomp
# print "Number of Shifts: "
# n = gets.chomp.to_i

# locked = ceaser_cipher(message, n)
# unlocked = decrypt_cease_cipher(locked, n)
# p locked
# p unlocked