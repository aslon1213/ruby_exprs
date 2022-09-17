begin
    print "You Input: "
    input = gets.chomp
    asci = input.each_byte.to_a
    if asci.all? {|ch| ch > 96 && ch < 123} 
        puts input
    else
        raise "InputError"
    end

rescue

retry

end