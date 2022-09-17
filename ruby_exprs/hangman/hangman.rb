require_relative 'display_info'
require_relative 'players.rb'
require 'json'
require 'csv'
include Display


# 1. menu 
# 2. saving progress so far
# 3. printing status


class Game
    def initialize
        @word_setter = WordSetter.new
        @solver = Solver.new()
        @file = nil
        @status = Array.new(@word_setter.word_length,nil)
        @wrong_inputs = []
        @game_over = false
        @wrongs = []
        option = first_menu
        if option == 1
            new_game
        else
            load_old_game
        end
    end

    def new_game
        f = File.open('saved_game.json', 'w')
        f.close
        @file = JSON.load File.read('saved_game.json')
        display_game(@wrong_inputs, @status)
        start_game
    end

    def start_game
        user_input = nil
        while (user_input != '3' && @game_over == false && @wrong_inputs.length < 10)
            user_input = @solver.get_input
            if user_input == '3'
                next
            end
            output = @word_setter.check_input(user_input)
            make_changes(output, user_input)
            display_game(@wrong_inputs, @status)
            right_length = 0
            @status.each do |num|
                if num 
                    right_length += 1
                end
            end
            if right_length == @word_setter.word_length
                @game_over = true
                puts
                puts %"
                   Secret Word: #{Display.italic("#{Display.green("#{@word_setter.get_word.join}")}")}
                    You guessed it finally - Congratulations #{Display.italic("#{Display.blue("#{@solver.name}")}")}!!!!!!!"
            end
        end
        if @wrong_inputs.length == 10
            @game_over = true
            message_after_losing(@word_setter)
        end
        save_game

    end

    def make_changes(input, user_input)
        
        if input.length == 0 && user_input.length == 1 &&  !(@wrong_inputs.include?(user_input))
            @wrong_inputs << user_input
        elsif user_input.length > 1 && input.length == 0
            error_for_wrong_input_size
        elsif @wrong_inputs.include?(user_input) || @status.include?(user_input)
            error_message_for_already_chosen_letter
        end
        input.each {|index| @status[index] = user_input}

    end

    def to_json_players(player)
        return player.to_json
    end

    def save_game
        json = JSON.dump(
            {
                :word_setter => JSON.parse(to_json_players(@word_setter)),
                :solver => JSON.parse(to_json_players(@solver)),
                :status => @status,
                :wrong_inputs => @wrong_inputs,
                :game_over => @game_over
            }
        )

        f= File.open('saved_game.json','w')
        f.write(json)
        f.close

    end

    def load_old_game
        f = File.open("saved_game.json")
        @file = JSON.load(f)
        f.close
        @solver.from_json(@file['solver'])
        @word_setter.from_json(@file['word_setter'])
        @status = @file['status']
        @wrong_inputs = @file['wrong_inputs']
        @game_over = @file['game_over']
        display_game(@wrong_inputs,@status)
        start_game

    end

end


game = Game.new()
game.load_old_game