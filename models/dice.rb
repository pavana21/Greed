class Dice
  attr_reader :score, :values, :number
  def initialize(number)
    @score = 0
    @values = []
    @number = number
  end
  
  def roll()
    @values = (1..number).map { 1 + rand(6) }
    @score = calculate_score(values)
    @number = 0 if @score == 0
    
    return @score
  end
  
  def calculate_score(dice)
      count = count_dice(dice)
      @score = score_count(count)
      @score
    end

  def count_dice(dice)
    count = Hash.new(0)
    dice.each { |die| count[die] += 1 }
    count
  end

  def score_count(count)
    @score = 0
    count.each do |die, count|
      if count >= 3
        @score += (die == 1 ? 1000 : die * 100)
        rem_dice = count - 3
      end
      rem_dice = count if rem_dice.nil?
      die_value = 0
      die_value = 100 if die == 1
      die_value = 50 if die == 5
      @score += rem_dice * die_value
    end
    @score
  end
end

