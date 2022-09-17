

module Display
	
  def message_after_losing(word_setter)
    puts Display.reverse_color(%"
          You loose - the secret Word is #{Display.italic("#{Display.green("#{word_setter.get_word.join}")}")}
      ")
  end

  def error_for_wrong_input_size
    puts Display.red("    Wrong input size - your input size can be equal to either 1 or the length of secret word")
  end

  def error_message_for_wrong_word
    puts Display.red("    That is the word")
  end

  def error_message_for_already_chosen_letter
    puts 
    puts Display.red('    You have chosen this letter already')
    puts
  end

  def error_message_for
  end

  def display_game(wrong_inputs, status)
    puts "(You have #{Display.red(10 - @wrong_inputs.length)} gueseses left until You are hung!!!!) "
    print "Wrong Inputs: "
    wrong_inputs.each {|input| print "#{Display.red(input)}, "}
    puts ''
    print "Currently: "
    status.each do |s|
      if s != nil
        print Display.blue(" #{s} ")
      else
        print Display.blue(' __ ')
      end
    end
    puts


  end


  def first_menu
    puts %"
      Choose From Given Options
      1. New Game
      2. Load previous game
    "
    input = 0
    input = gets.chomp.to_i
    
    while input != 1 && input != 2
      input = gets.chomp.to_i
    end
    return input

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

end
