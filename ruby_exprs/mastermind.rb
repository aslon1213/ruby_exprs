#require 'pry-byebug'

# blue blue red magenta
# a module to store console output related functions
module DisplayInfo

	# function to convert input from [number,color_name] to color_name
  def self.color_code_hash
    {
      'blue' => ['blue', '2', 2],
      'green' => ['green', '1', 1],
      'magenta' => ['purple', 'magenta', '6', 6],
      'red' => ['red', 'r', '3', 3],
      'brown' => ['brown', '5', 'yellow', 5],
      'gray' => ['gray', '4', 4]
    }
  end

	# function to get player's secret code
  def self.make_code
    code = []
    DisplayInfo.display_code_maker_options
    while code.length < 4
      print 'your input: '
      inputs = gets.split(' ')
      inputs.each do |input|
        DisplayInfo.color_code_hash.each_pair do |key, value|
          code << key if value.any? { |val| val == input }
        end
      end
    end
    # binding.pry
    code
  end

	# converting input numbers to colors
  def num_to_colors(inputs)
    code = []
    inputs.each do |input|
      DisplayInfo.color_code_hash.each_pair do |key, value|
        code << key if value.any? { |val| val == input }
      end
    end
    code
  end

	# all different colors
  def self.black(value)
    "\e[30m#{value}\e[0m"
  end

  def self.red(value)
    "\e[31m#{value}\e[0m"
  end

  def self.green(value)
    "\e[32m#{value}\e[0m"
  end

  def self.brown(value)
    "\e[33m#{value}\e[0m"
  end

  def self.blue(value)
    "\e[34m#{value}\e[0m"
  end

  def self.magenta(value)
    "\e[35m#{value}\e[0m"
  end

  def self.cyan(value)
    "\e[36m#{value}\e[0m"
  end

  def self.gray(value)
    "\e[37m#{value}\e[0m"
  end

  def bg_black(value)
    "\e[40m#{value}\e[0m"
  end

  def bg_red(value)
    "\e[41m#{value}\e[0m"
  end

  def bg_green(value)
    "\e[42m#{value}\e[0m"
  end

  def bg_brown(value)
    "\e[43m#{value}\e[0m"
  end

  def bg_blue(value)
    "\e[44m#{value}\e[0m"
  end

  def bg_magenta(value)
    "\e[45m#{value}\e[0m"
  end

  def bg_cyan(value)
    "\e[46m#{value}\e[0m"
  end

  def bg_gray(value)
    "\e[47m#{value}\e[0m"
  end

  def bold(value)
    "\e[1m#{value}\e[22m"
  end

  def italic(value)
    "\e[3m#{value}\e[23m"
  end

  def underline(value)
    "\e[4m#{value}\e[24m"
  end

  def blink(value)
    "\e[5m#{value}\e[25m"
  end

  def reverse_color(value)
    "\e[7m#{value}\e[27m"
  end

  def self.first_menu
    puts 'Which one you want to be ?'
    puts '1. Code Maker'
    puts '2. Code Breaker'
    puts 'If you are a newcomer please read the rules first'
    puts '3. Read rules'
  end

  def self.print_rules
    puts "
		Mastermind or Master Mind is a code-breaking game for two players.
		1 - Code Maker
		2 - Code Breaker 
		Code Maker makes a code using 6 color 
		#{DisplayInfo.display_code_maker_options_re}
		Then Code Maker sets how many turns the Code Breaker should take 
		
		Code Breaker makes guesses without having any idea about Code Maker set of colors

		After Code Breaker made a guess, game board will give two two types of clues
		1. Colored circle - #{green("\u2B24")} means that guess contains the correct color on correct place
		2. Emptry cirlce - #{gray("\u25EF")} mean that the guess contains the correct color but on wrong place

		The Code Breaker should find a correct code in number of turns the Code Maker set
		otherwise Code Maker wins.

		##########################################################################
		Inputs for colors should be given in this format:
		Example:
		#{DisplayInfo.display_code_maker_options_re}
		your input: 1 2 3 4
		
		then input would be:
		#{green("    \u25EF")} #{blue("     \u25EF")} #{red("    \u25EF")} #{gray("    \u25EF")} 

		"
    gets
  end

  # circle = \u25EF
	# full circle - \u2B24
  def self.display_code_maker_options
    puts "#{green("    \u25EF")} #{blue("     \u25EF")} #{red("    \u25EF")} #{gray("    \u25EF")} #{brown("	\u25EF")} #{magenta("	\u25EF")}"
    puts "#{green('1.green')} #{blue('2.blue')} #{red('3.red')} #{gray('4.gray')} #{brown('5.brown')} #{magenta('6.magenta')}"
  end

	def self.display_code_maker_options_re
		"#{green("    \u25EF")} #{blue("     \u25EF")} #{red("    \u25EF")} #{gray("    \u25EF")} #{brown("	\u25EF")} #{magenta("	\u25EF")} \n		 #{green('1.green')} #{blue('2.blue')} #{red('3.red')} #{gray('4.gray')} #{brown('5.brown')} #{magenta('6.magenta')}"
  end

	# print to console - breaker's guess after input
  def self.print_guess(guess)
    printing = ''
    guess.each do |g|
      case g
      when 'blue'
        printing += blue("     \u25EF")
      when 'green'
        printing += green("     \u25EF")
      when 'magenta'
        printing += magenta("     \u25EF")
      when 'red'
        printing += red("     \u25EF")
      when 'gray'
        printing += gray("     \u25EF")
      when 'brown'
        printing += brown("     \u25EF")
      end
    end

    print "Input: #{printing}"
  end

	# congratulation's message if someone wins 
  def self.congratulate(winner, number_of_trials)
    puts "
		'#{winner}' Congaratulations!!! You have succesfully broken this code
		Number of Trials: #{number_of_trials}
		"
  end

	# print to console clues to guess after guess was made
  def self.print_output(output)
    # if array contains
    # nil -- then the codebreaker guess contains the correct color in wrong place
    # 1 -- then the codebreaker guess contains correect color in correct place
    # -1 -- then the codebreaker guess contains uncorrect color
    puts
    print 'Clues:  '
    output.each do |val|
      case val
      when 'B'
        print "#{green("\u2B24")}	"
      when 'W'
        print "#{gray("\u25EF")} 	"
      end
    end
    puts
  end

	# comparing guess and code and getting the exact places
  def self.exact_places_search(made_code, opponent_code)
    output = []
    opponent_code.each_with_index do |val, ind|
      made_code.each_with_index do |value, index|
        output << ind if (val == value) && (ind == index)
      end
    end
    output
  end

	# checks code for clues
	# inputs --> maker's code (made_code), and breaker's guess (opponent_code)
	# returns --> an array of "W" and "B" characters (description belove)
  def self.check_code(made_code, opponent_code)
    # if array contains
    # W -- then the codebreaker guess contains the correct color in wrong place
    # B -- then the codebreaker guess contains correect color in correct place
    output = []
    opponent_copy = opponent_code.map(&:clone)
    code_copy = made_code.map(&:clone)

    iss = exact_places_search(code_copy, opponent_copy)
    iss.each do |val|
      opponent_copy[val] = nil
      code_copy[val] = nil
    end

    iss_2 = []
    opponent_copy.each_with_index do |val, ind|
      code_copy.each_with_index do |value, index|
        next unless val == value && !val.nil? && !value.nil?

        iss_2 << 1
        opponent_copy[ind] = nil
        code_copy[index] = nil
      end
    end

    iss.each { output << 'B' }
    iss_2.each { output << 'W' }
    output
  end
end

# code breakers code --> for human player 
class CodeBreaker
  include DisplayInfo
  attr_reader :name

  def initialize(name = 'Robot')
    @name = name
    @code = []
  end

  def break_code(_last_output, _turn_num)
    @code = DisplayInfo.make_code
  end
end

# code breaker - robot


class CodeBreakerRobot < CodeBreaker
	# this computer imitated breaker solves the code less than 5 moves 
	# to do this it uses Donald Knuth's five guess algorithm
	# desctipntion of this algorithm is written here 👇👇👇
	# Mastermind-Five-Guess-Algorithm

# algorithm description
# Donal Knuth's five guess algorithm for solving the game Mastermind.
# In 1977, Donald Knuth demonstrated that the codebreaker can solve the pattern in five moves or fewer, 
# using an algorithm that progressively reduced the number of possible patterns.

# The algorithm works as follows:

# 1. Create the set S of 1296 possible codes (1111, 1112 ... 6665, 6666).

# 2. Start with initial guess 1122 (Knuth gives examples showing that other first guesses such as 1123, 1234 do not win in five tries on every code).

# 3. Play the guess to get a response of colored and white pegs.

# 4. If the response is four colored pegs, the game is won, the algorithm terminates.

# 5. Otherwise, remove from S any code that would not give the same response if the current guess were the code.

# For example, if your current guess is 1122 and you get a response of BW;
# If the code were 1111 you would get two black pegs (BB) with a guess of 1122, which is not the same as
# one black peg and one white peg (BW). So, remove 1111 from the list of potential solutions.
# F(1122,1112) = BBB≠BW →Remove 1112 from S
# F(1122,1113) = BB≠BW →Remove 1113 from S
# F(1122,1114) = BB≠BW →Remove 1114 from S
# F(1122,1314) = BW=BW →Keep 1314 in S

# 6. Apply minimax technique to find a next guess as follows:
# For each possible guess, that is, any unused code of the 1296 not just those in S,
# calculate how many possibilities in S would be eliminated for each possible colored/white peg score.
# The score of a guess is the minimum number of possibilities it might eliminate from S.

# A single loop through S for each unused code of the 1296 will provide a 'hit count' for each of the
# possible colored/white peg scores; Create a set of guesses with the smallest max score (hence minmax).
# From the set of guesses with the minimum (max) score, select one as the next guess, choosing a member of S whenever possible.

# Knuth follows the convention of choosing the guess with the least numeric value e.g. 2345 is lower than 3456.
# Knuth also gives an example showing that in some cases no member of S will be among the highest scoring guesses
# and thus the guess cannot win on the next turn, yet will be necessary to assure a win in five.

# Table of example scoreset counts for two possible next guesses
# Scores(B/W)	RRGB	RGBG
# (0,0)	25	15
# (0,1)	4	84
# (0,2)	6	0
# (0,3)	0	0
# (0,4)	0	0
# (1,0)	15	0
# (1,1)	10	0
# (1,2)	0	0
# (1,3)	5	0
# (2,0)	5	0
# (2,1)	3	0
# (2,2)	2	0
# (3,0)	24	0
# (4,0)	1	1
# max	25	84
# 7.Repeat from step 3.


  include DisplayInfo
  attr_reader :name

  def initialize
    super
    @set = create_set
    @all_guesses = create_set
    @guess = [1, 1, 2, 2] # initial guess
    # break_code([],1)
  end

  # permutations
  def create_set
    [1, 2, 3, 4, 5, 6].repeated_permutation(4).to_a
  end

	#
  def get_result(last_output, value)
    output = DisplayInfo.check_code(value, @guess)
    last_output.join == output.join
  end

	# removing unnecessary possible values from @set
  def delete_from_set(last_output)
    @set = @set.select { |value| get_result(last_output, value) }
    # binding.pry
  end

	# 
  def break_code(last_output, turn_num)
		# step 1
    return @guess if turn_num == 1
		# step 3 - 4 - done in other classes  - where guess is checked for correctness
		# step 5 - removing unnecessary possible values from @set
    delete_from_set(last_output)
		# step 6.1 - minimax algorithm - get optimal results from @set
    results = minimax
		# step 6.1 - choose the best from results and assign it to @guess
    pick_guess(results)
    # binding.pry
    @guess
  end

	# picks the best from results and assigns it to @guess
  def pick_guess(results)
    results.sort_by! { |i, score| [score, i] }
    min_score = results[0][1]
    min_set = results.select { |arr| arr[1] == min_score }
    min_set_in_s = min_set.select { |arr| @set.include? @all_guesses[arr[0]] }
    @guess = if min_set_in_s.empty?
               @all_guesses[min_set[0][0]]
             else
               @all_guesses[min_set_in_s[0][0]]
             end
  end

	# minimax algorithm
  def minimax
    results = {}
    @all_guesses.each_with_index do |arr, i|
      next if i.even? && (i % 3).zero? && (i % 4).zero? && i.positive?

      scores = []
      possible_keys.each do |keys|
        score = hit_count(arr, keys[0], keys[1])
        scores.push(score)
      end
      results[i] = scores.max
    end
    results.to_a
  end

	#
  def hit_count(arr, num_keys, reds)
    @set.select { |e| common(e, arr) == num_keys && exact(e, arr) != reds }.length
  end

	# returns common numbers
  def common(arr1, arr2)
    (arr1 & arr2).flat_map { |n| [n] * [arr1.count(n), arr2.count(n)].min }.length
  end
	# returns exact numbers with exact indexes
  def exact(arr1, arr2)
    count = 0
    arr1.each_with_index { |val, i| count += 1 if arr2[i] == val }
    count
  end

	# possible clue(X,Y) combinations
	# X - the number of "B"s
	# Y - the number of "W"s
  def possible_keys
    # each element is an array of the form [total keys, red keys]
    # represents all possible white/red key results
    arr = [0, 1, 2, 3, 4]
    arr.repeated_permutation(2).select { |a| a[1] >= a[0] }
  end
end

# code makers class - human 
class CodeMaker
  include DisplayInfo

  attr_reader :max_number_of_trials, :name

  def initialize(name = 'Robot')
    @name = name
    @code = []
    @max_number_of_trials = 0
  end

  def set_code
    @code = DisplayInfo.make_code
    @code = @code.each { |vak| vak = vak.to_s }
    print 'How many trials should your opponent will be given: '
    @max_number_of_trials = gets.to_i
  end

  def self.exact_places_search(opponent_code)
    output = []
    opponent_code.each_with_index do |val, ind|
      @code.each_with_index do |value, index|
        output << ind if (val == value) && (ind == index)
      end
    end
    output
  end

  def check_opponents_code(opponent_code)
    # if array contains
    # 0 -- then the codebreaker guess contains the correct color in wrong place
    # 1 -- then the codebreaker guess contains correect color in correct place
    # -1 -- then the codebreaker guess contains uncorrect color
    # code_hash = {
    # 	blue:[],
    # 	green:[],
    # 	red:[],
    # 	gray:[],
    # 	brown:[],
    # 	magenta:[],
    # }

    # opponent_hash = {
    # 	blue:[],
    # 	green:[],
    # 	red:[],
    # 	gray:[],
    # 	brown:[],
    # 	magenta:[],
    # }

    # @code.each_with_index do |color, index|
    # 	code_hash[color] << index
    # end
    # opponent_code.each_with_index do |color, index|
    # 	opponent_hash[color] << index
    # end
    # [4,3,3,4]
    # [3,4,4,4]
    output = []
    opponent_copy = opponent_code.map(&:clone)
    code_copy = @code.map(&:clone)
    iss = []
    opponent_code.each_with_index do |val, ind|
      @code.each_with_index do |value, index|
        iss << ind if (val == value) && (ind == index)
      end
    end
    iss.each do |val|
      opponent_copy[val] = nil
      code_copy[val] = nil
    end

    iss_2 = []
    opponent_copy.each_with_index do |val, ind|
      code_copy.each_with_index do |value, index|
        next unless val == value && !val.nil? && !value.nil?

        iss_2 << 1
        opponent_copy[ind] = nil
        code_copy[index] = nil
      end
    end

    iss.each { output << 'B' }
    iss_2.each { output << 'W' }
    # binding.pry
    output
  end
end

# code makers class - robot
class CodeMakerRobot < CodeMaker
  include DisplayInfo

  attr_reader :max_number_of_trials, :name

  def set_code
    inputs = []
    (1..4).each do |_i|
      inputs << rand(1..6).to_s
    end
    p inputs
    inputs.each do |input|
      DisplayInfo.color_code_hash.each_pair do |key, value|
        @code << key if value.any? { |val| val == input }
      end
    end
    puts "####### #{@code} #####"
    @max_number_of_trials = rand(6..12)
  end
end

# game class - 
class MasterMind
  include DisplayInfo

  def initialize
    @maker = nil
    @breaker = nil
    @max_number_of_trials = 0 # set by code maker
    @number_of_trials = 0  # set by code maker
    @game_status = true # is false when breaker correctly solves the code or used all trial numbers
    start # function 
    guessing # main game process
  end

	# gets user input - whether user wants to be braker or maker
  def start
    puts 'Welcome to MASTERMIND'
    puts 'Choose from given Options'
    DisplayInfo.first_menu
    option = gets.to_i
    system('clear') # clear terminal before drawing
    while option != 1 || option != 2
      case option
      when 1
        print 'What is Your Name: '
        name = gets.chomp
        # name = 'Aslon'
        @maker = CodeMaker.new(name)
				puts 'You are now Code Maker - please write your code ->'
        @maker.set_code
        system('clear') # clear terminal before drawing
				puts "#{name}, You are Playing against our Robot"
				puts "It can break the code less than 5 guesses!!!! - lets see if it can do this :))"
        @max_number_of_trials = @maker.max_number_of_trials
        @breaker = CodeBreakerRobot.new
        break
      when 2
        print 'What is Your Name: '
        name = gets
        @breaker = CodeBreaker.new(name)
        @maker = CodeMakerRobot.new
        @maker.set_code
        system('clear') # clear terminal before drawing
        @max_number_of_trials = @maker.max_number_of_trials
        break
      when 3
        DisplayInfo.print_rules
        puts 'Choose from given Options'
        DisplayInfo.first_menu
      end
      option = gets.to_i
      print "#{option} option"
    end
  end

	# main game process
  def guessing
    puts 'Start Breaking the code'
    last_output = %w[W W W W]
    # binding.pry

    while @game_status && (@max_number_of_trials != @number_of_trials)
      puts "#{@max_number_of_trials - @number_of_trials} trials left !"
      turn_num = @number_of_trials + 1
      code = []
      inputs = @breaker.break_code(last_output, turn_num)
      inputs.each do |input|
        DisplayInfo.color_code_hash.each_pair do |key, value|
          code << key if value.any? { |val| val == input }
        end
      end
      DisplayInfo.print_guess(code)

      @number_of_trials += 1
      last_output = check_code(code)
      DisplayInfo.print_output(last_output)
      puts "######################################################### \n"
      # binding.pry
    end
		if @game_status
			return 1
		end
    if @max_number_of_trials == @number_of_trials
      puts 'You ran out of your trials and could not break the code so lose this game'
    end
  end

  private
	# inputs - the code of guesser
	# returns - clues array
  def check_code(code)
		# checks for breaker input and maker code and returns clues
    output = @maker.check_opponents_code(code)
    if output.all? { |val| val == 'B' } && output.length == 4
      @game_status = false
      DisplayInfo.print_output(output)
      DisplayInfo.congratulate(@breaker.name, @number_of_trials)
      DisplayInfo.print_guess(code)
    end
    # binding.pry
    output
  end
end

# start game 
MasterMind.new

