class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup,i|
      unless i == 6 || i == 13
        4.times {cup << :stone}
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos > 12 || start_pos < 0 || start_pos == 6
      raise "Invalid starting cup"
    elsif self.cups[start_pos].length == 0
      raise "Starting cup is empty"
    end
    true
  end

  def make_move(start_pos, current_player_name)
    # render
    # return false unless valid_move?(start_pos)
    skip = nil
    if current_player_name == self.name1
      skip = 13
    else
      skip = 6
    end
    next_idx = start_pos
    if valid_move?(next_idx)
      count = self.cups[next_idx].length
      self.cups[next_idx] = []
      while count > 0
        next_idx = next_cup(next_idx)
        unless next_idx == skip
          self.cups[next_idx] << :stone
          count -= 1
        end
      end
      render
      next_turn(next_idx)
      if next_idx == (skip + 7) % 14
        return :prompt
      elsif self.cups[next_idx].length == 1
        return :switch
      else
        return next_idx
      end
    end
  end

  def next_cup(cup_idx)
    return 0 if cup_idx == 13
    cup_idx+1
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    self.cups[0..5].none?{|cup| cup.length > 0} || self.cups[7..12].none? {|cup| cup.length > 0}
  end

  def winner
    return :draw if self.cups[6].length == self.cups[13].length
    return self.name1 if self.cups[6].length > self.cups[13].length
    self.name2
  end
end
