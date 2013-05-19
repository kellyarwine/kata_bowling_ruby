require 'game'

describe Game do

  let(:game) { Game.new }

  it "returns a score of 5 when 5 pins are input" do
    game.add(5)
    game.score.should == 5
    game.get_current_frame.should == 1
  end

  it "returns a score of 5 when 5 pins are input" do
    game.add(5)
    game.add(4)
    game.score.should == 9
    game.get_current_frame.should == 2
  end

  it "returns a score and score for frame for 4 throws" do
    game.add(5)
    game.add(4)
    game.add(7)
    game.add(2)
    game.score.should == 18
    game.score_for_frame(1).should == 9
    game.score_for_frame(2).should == 18
    game.get_current_frame.should == 3
  end

  it "returns a score when there is a spare" do
    game.add(3)
    game.add(7)
    game.add(3)
    game.score_for_frame(1).should == 13
    game.get_current_frame.should == 2
  end

  it "returns a score of 10 plus the next frame when there is a spare" do
    game.add(3)
    game.add(7)
    game.add(3)
    game.add(2)
    game.score_for_frame(1).should == 13
    game.score_for_frame(2).should == 18
    game.calculate_score.should == 18
    game.get_current_frame.should == 3
  end

  it "returns a score of 10 plus the next 2 frames when there is a strike" do
    game.add(10)
    game.add(3)
    game.add(6)
    game.score_for_frame(1).should == 19
    game.score_for_frame(2).should == 28
    game.calculate_score.should == 28
    game.get_current_frame.should == 3
  end

  it "returns the score of a perfect game" do
    12.times do
      game.add(10)
    end

    game.score_for_frame(1).should == 30
    game.score_for_frame(2).should == 60
    game.get_current_frame.should == 11
    game.calculate_score.should == 300
  end

  it "test end of array" do
    9.times do
      game.add(0)
      game.add(0)
    end

    game.add(2)
    game.add(8)
    game.add(10)

    game.calculate_score.should == 20
  end

  it "returns the score of a perfect game" do
    game.add(1)
    game.add(4)
    game.add(4)
    game.add(5)
    game.add(6)
    game.add(4)
    game.add(5)
    game.add(5)
    game.add(10)
    game.add(0)
    game.add(1)
    game.add(7)
    game.add(3)
    game.add(6)
    game.add(4)
    game.add(10)
    game.add(2)
    game.add(8)
    game.add(6)

    game.calculate_score.should == 133
  end


end