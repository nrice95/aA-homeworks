require "colorize" #don't forget to bundle install colorize, kids!

class Simon
  COLORS = %w(red blue green yellow)
  # COLORIZE = {
  #   red:
  # }

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def method_missing(method_name, *args)
    case args[0]
    when "red"
      return args[0].red
    when "blue"
      return args[0].blue
    when "green"
      return args[0].green
    when "yellow"
      return args[0].yellow
    end
  end

  def play
    until self.game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message unless self.game_over
  end

  def show_sequence
    add_random_color
    system("clear")
    self.seq.each do |color|
      system("clear")
      str = color(color)
      pre_string(str,true)
      sleep(1)
      system("clear")
      pre_string
      sleep(1)
    end
  end

  def pre_string(str = nil,colored = false)
    if str.nil?
      16.times {print " "}
      print ": ".cyan
    else
      if colored
        (29-str.length).times {print " "}
      else
        (16-str.length).times {print " "}
      end
      print str
      print " : ".cyan
    end
  end

  def require_sequence
    system("clear")
    pre_string("Play that back!".white)
    sleep(1)
    i = 0
    self.seq.each do |color|
      system("clear")
      pre_string
      guess = gets.chomp
      unless match?(guess,color)
        self.game_over = true
        break
      end
    end
  end

  def add_random_color
    self.seq << COLORS.sample
  end

  def round_success_message
    puts "Correct!"
    self.sequence_length += 1
  end

  def game_over_message
    puts "Fail!"
    puts "Score: #{self.sequence_length - 1}"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end

  # private
  def match?(guess,color)
    guess[0].downcase == color[0].downcase
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
