def make_count(string, substring)
	string_arr = string.downcase.split(substring)
	return string_arr.count - 1
end

def substrings(string, array)

	h = {}
	array.each do |item|
		if string.downcase.include?(item)
			if h.dig(item) == nil
				h[item] = 0
			end
			n = make_count(string, item)
			h[item] += n
		end
	end
	return h
end



# dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
# h = substrings("Howdy partner, sit down! How's it going?", dictionary)
# print(h)

