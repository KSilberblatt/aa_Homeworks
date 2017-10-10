class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    (0...@cups.length).each do |i|
      4.times { @cups[i] << :stone } unless [6, 13].include?(i)
    end

  end

  def place_stones # I didn't notice this before I wrote initialize
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos <= 0 || start_pos > 12

  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    i = start_pos + 1

    until stones.empty?
      @cups[6] << stones.pop if current_player_name == @name1 && i == 6
      @cups[13] << stones.pop if current_player_name == @name2 && i == 13
      @cups[i] << stones.pop unless [6, 13].include?(i)
      i += 1
      i = 0 if i > 13

    end
    i -= 1
    i = 13 if i < 0
    render
    next_turn(i)

  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if [6, 13].include?(ending_cup_idx)
      :prompt
    elsif @cups[ending_cup_idx].length == 1
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
    return true if @cups[0..5].all? { |el| el.empty? }
    return true if @cups[7..12].all? { |el| el.empty? }
    false
  end

  def winner
    p_one = @cups[6].count
    p_two = @cups[13].count
    return :draw if p_one == p_two
    return @name1 if p_one > p_two
    @name2
  end
end
