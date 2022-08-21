require "pry-byebug"

class Player
        attr_reader :moves
	attr_reader :type
	attr_reader :name
	@@patters = [[1,2,3], [4,5,6], [7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

	def initialize(type, name)
		@type = type		#character which is displayed on the table 
		@name = name 		# name of the player
		@moves = []			# places so far chosen
	end

	#get a number and store them on @moves
	def store_moves(move_num)
		@moves << move_num
	end

	def move_output()
		return "#{@name}(#{@type}) please choose your next move number: "
	end

	#if player has moves which qualify for a winner returns true otherwise false
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
		@player_1 = player_1		# player_1 is object Player class
		@player_2 = player_2		# player_1 is object Player class
		@size = size						#size of table - default is 3X3
		@chosen = []						#used to check for available player inputs --- stores already chosen places
		@status = true					#if player wins then @status is false
		@winner = nil						#if player wins then @winner should be set to the name of player
	end 


	#get a move number from a @player_1/2
	def make_move(player)
		draw_table
		print player.move_output
		num = gets.to_i
		#check for available moves
		until !(@chosen.include?(num)) && num <= @size**2 && num >= 1 do
			print player.move_output
			num = gets.to_i
		end
		player.store_moves(num)
		@chosen << num
		check_status
	end

	#draw table on terminal
	def draw_table()
		system("clear") #clear terminal before drawing
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

	#identify so far any players made succesfull winning combinations
	def check_status
		#check for indiviudal players
		p_1 = @player_1.check_status
		p_2 = @player_2.check_status
		if p_1 || p_2
			#adjust game status
			@status = false
			#adjust winner
			if p_1 
				@winner = @player_1.name.chomp
			else
				@winner = @player_2.name.chomp
			end
		end
	end	

	#congratulations message
	def congratulate_winner
		puts "Game Over !"
		print "Congratulations #{@winner} !!!!!"
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
while p_1_t == p_2_t
		puts 'try another character: '
		p_2_t = gets.chomp![0]
end
puts "Your character is '#{p_2_t}'"
player_1 = Player.new(p_1_t, p_1_n)
player_2 = Player.new(p_2_t, p_2_n)
#tic tac toe
game = Tic_Tac_Toe.new(3,player_1, player_2) #game


#iterage 9 times 
i = 0
while (game.status) && (i < 9)
	#first playet moves
	if i % 2 == 0
		game.make_move(player_1)
		game.draw_table()
		i += 1
	#second player moves
	else
		game.make_move(player_2)
		game.draw_table()
		i += 1
	end
end

game.congratulate_winner

