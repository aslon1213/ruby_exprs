require "pry-byebug"

class Player
	attr_reader :moves
	attr_reader :type
	attr_reader :name
	@@patters = [[1,2,3], [4,5,6], [7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
	def initialize(type, name)
		@type = type
		@name = name
		@moves = []

	end
	def store_moves(move_num)
		@moves << move_num
	end

	def move_output()
		return "#{@name}(#{@type}) please choose your next move number: "
	end

	def Player.character_check(character)
		if character.is_a?('Char')
			return 1
		else
			return 0
		end
	end

	def check_status
		output = false
		@@patters.each do |pattern|
			o_2 = pattern.all? {|p| @moves.include?(p) }
			if o_2
				output = o_2
			end
		end
		return output
	end	

end


class Tic_Tac_Toe
	attr_reader :chosen
	attr_reader :status
	def initialize(size = 3, player_1, player_2)
		@player_1 = player_1
		@player_2 = player_2
		@size = size
		@chosen = []
		@status = true
		@winner = nil
	end 

	def make_move(player)
		draw_table
		print player.move_output
		num = gets.to_i
		until !(@chosen.include?(num)) && num <= @size**2 && num >= 1 do
			print player.move_output
			num = gets.to_i
		end
		player.store_moves(num)
		@chosen << num
		check_status
	end

	def draw_table()
		system("clear")
		for i in (0 ... @size)
			arr = []
			for j in (1 .. @size)
				n = i * @size + j
				if @player_1.moves.include?(n)
					arr << @player_1.type
				elsif @player_2.moves.include?(n)
					arr << @player_2.type
				else
					arr << n
				end
			end
			puts "---+---+---"
			puts "|#{arr[0]} | #{arr[1]} | #{arr[2]}|"
		end
		puts "--+---+---"
	end

	def check_status
		p_1 = @player_1.check_status
		p_2 = @player_2.check_status
		#binding.pry
		if p_1 || p_2
			@status = false
			if p_1 
				@winner = @player_1
			else
				@winner = @player_2

			
			end
		end
	end	

	def congratulate_winner
		puts "Game Over !"
		print "Congratulation #{@winner.name.chomp} !!!!!"
	end


end

#initialization
print "What is the Name of First Player: "
p_1_n = gets
print("What character would you choose: ")
p_1_t = gets.chomp![0]
puts "Your character is '#{p_1_t}'"
print "What is the Name of First Player: "
p_2_n = gets
print("What character would you choose: ")
p_2_t = gets.chomp![0]
puts "Your character is '#{p_2_t}'"
player_1 = Player.new(p_1_t, p_1_n)
player_2 = Player.new(p_2_t, p_2_n)
game = Tic_Tac_Toe.new(3,player_1, player_2)


#chompint
i = 0
until !(game.status) && i < 8
	if i % 2 == 0
		game.make_move(player_1)
		game.draw_table()
		i += 1
	else
		game.make_move(player_2)
		game.draw_table()
		i += 1
	end
end


game.congratulate_winner

