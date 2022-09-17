require 'csv'
class Player

	attr_reader :name

	def initialize(name)
		@name = name
	end

	def random_names
		file = CSV.read('1000-popular-names.csv')
		names = file
		name = names[rand(names.length)]
		puts "Your name is #{name[0]}"
		return name[0]
	end

	def to_json
		return JSON.dump(
				{
						:name => @name,
				}
		)
	end
end


class WordSetter < Player

	attr_reader :word_length
	attr_reader :name

	def initialize()
		@word_length = set_secret_word
	end


	def from_json(f)
		@word_length = f['word_length']
		@name = f['name']
		@word = f['word']

	end


	def take_random_word
		words = File.open('google-10000-english-no-swears.txt', 'r').readlines
		return words[rand(words.length)]
	end

	def check_input(input)
		if input.length == @word_length
				check_whole_word(input)
		else
				check_input_by_char(input)
		end
	end

	def to_json
			return JSON.dump(
					{
							:name => @name,
							:word_length => @word_length,
							:word => @word
					}
			)
	end

	def get_word
		return @word
	end


	private
	def check_input_by_char(input_from_user)
		output = []
		if @word.include?(input_from_user)
				@word.each_with_index do |letter,index|
						if letter == input_from_user
								output << index
						end
				end 
		end
		return output
	end


	def check_whole_word(input)
		output = []
		if @word.join == input
			@word.each_with_index do |ch, index|
				output << index
			end
		end
		return output
	end


	def set_secret_word
		@word = take_random_word.chomp
		@word = @word.split('')
		return @word.length
	end

end


class Solver < Player

	def initialize(name = random_names)
		super(name)
	end

	def from_json(f)
		@name = f['name']
	end

	def get_input()
		begin
			print "You Input: "
			input = gets.chomp
			asci = input.each_byte.to_a
			if asci.all? {|ch| ch > 96 && ch < 123} || input == "3" 
					return input
			else
					raise "InputError"
			end
	
		rescue
		
		retry
		end
	end


end