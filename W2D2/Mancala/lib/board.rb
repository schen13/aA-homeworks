require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    @cups.each_index do |idx|
      unless idx == 6 || idx == 13
        cups[idx] = Array.new(4, :stone)
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(0,13)
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    current_stones = @cups[start_pos]
    @cups[start_pos] = []
    idx = start_pos
    until current_stones.empty?
      idx += 1
      idx = 0 if idx > 13
      if idx == 6
        @cups[6] << current_stones.pop if current_player_name == @name1
      elsif idx == 13
        @cups[13] << current_stones.pop if current_player_name == @name2
      else
        @cups[idx] << current_stones.pop
      end
    end
    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif cups[ending_cup_idx].size == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all? { |cup| cup.empty? } ||
    cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    case cups[6].size <=> cups[13].size
    when 0
      return :draw
    when 1
      return name1
    when -1
      return name2
    end
  end

  private

  attr_reader :name1, :name2
end
