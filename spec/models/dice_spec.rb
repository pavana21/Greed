require '/Users/pavana/projects/greed/models/dice.rb'

describe Dice do
  it "should initialize the number to dice" do
    @dice = Dice.new(5)
    @dice.number.should eq(5)
  end
  
  it "has a score of zero" do
    @dice = Dice.new(5)
    @dice.score.should eql(0)
  end

  it "should have no values" do
    @dice = Dice.new(5)
    @dice.values.should eql([])
  end
  
  it "values should be an array of integers" do
    @dice = Dice.new(5)
    @dice.roll()
    @dice.values.should be_a(Array)
  end
  
  it "should not change values unless rolled " do
    @dice = Dice.new(5)
    @dice.roll()
    first_values = @dice.values
    second_values = @dice.values
    first_values.should eq(second_values)
  end
  
  it "should change values when rolled" do
    @dice = Dice.new(5)
    @dice.roll()
    first_values = @dice.values
    @dice.roll()
    second_values = @dice.values
    first_values.should_not eq(second_values)
  end
  
  it "should count number of dice values are same" do
    @die = Dice.new(5)
    @count = @die.count_dice([1,1,1,3,5])
    @count[1].should == 3
  end
  
  it "score should be zero if number is zero " do
    @dice = Dice.new(0)
    @dice.roll()
    @dice.score.should eq(0)
    @dice.number.should eq(0)
  end
  
  it "should score 50 when it rolls a die as 5" do
    @die = Dice.new(0)
    @die.calculate_score([5]).should eq(50)
  end
  
  it "should score 100 when it rolls a die as 1" do
    @die = Dice.new(0)
    @die.calculate_score([1]).should == 100
  end
  
  it "should calculate score for triplets" do
    @die = Dice.new(0)
    @die.calculate_score([1,1,1]).should eq(1000)
    @die.calculate_score([2,2,2]).should eq(200)
    @die.calculate_score([3,3,3]).should eq(300)
    @die.calculate_score([4,4,4]).should eq(400)
    @die.calculate_score([5,5,5]).should eq(500)
    @die.calculate_score([6,6,6]).should eq(600)
  end
  
  it "should score zero for non scoring values" do
    @die = Dice.new(0)
    @die.calculate_score([3,2,6,4,2]).should eq(0)
  end
  
  it "should score a mixed sum" do
    @die = Dice.new(0)
    @die.calculate_score([1,2,3,4,5]).should eq(150)
    @die.calculate_score([2,3,2,5,2]).should eq(250)
  end
  
end