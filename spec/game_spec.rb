require 'game'

def add_all scores
  game = Game.new
  scores.each do |score|
    game.add(score)
  end
  game
end

describe Game do
  it "returns a score of 5 when 5 pins are input" do
    add_all([5, 4]).calculate_score.should == 9
  end

  it "returns the score of a perfect game" do
    game = add_all([1, 4, 4, 5, 6, 4, 5, 5, 10, 0,
                    1, 7, 3, 6, 4, 10, 2, 8, 6])

    game.calculate_score.should == 133
  end

  it "test end of array" do
    add_all((Array.new(18){0}).push(2, 8, 10)).calculate_score.should == 20
  end

  it "returns a score and score for frame for 4 throws" do
    game = add_all([5, 4, 7, 2])
    game.calculate_score.should == 18
    game.scorer.score_for_frame(1).should == 9
    game.scorer.score_for_frame(2).should == 18
  end

  it "returns a score when there is a spare" do
    add_all([3, 7, 3]).scorer.score_for_frame(1).should == 13
  end

  it "returns a score of 10 plus the next frame when there is a spare" do
    game = add_all([3, 7, 3, 2])
    game.scorer.score_for_frame(1).should == 13
    game.scorer.score_for_frame(2).should == 18
    game.calculate_score.should == 18
  end

  it "returns a score of 10 plus the next 2 frames when there is a strike" do
    game = add_all([10, 3, 6])
    game.scorer.score_for_frame(1).should == 19
    game.scorer.score_for_frame(2).should == 28
    game.calculate_score.should == 28
  end

  it "returns the score of a perfect game" do
    game = add_all(Array.new(12) {10})
    game.scorer.score_for_frame(1).should == 30
    game.scorer.score_for_frame(2).should == 60
    game.calculate_score.should == 300
  end
end
