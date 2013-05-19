require 'scorer'

class Game
  attr_accessor :scorer

  def initialize
    @itsCurrentFrame = 1
    @firstthrowinframe = true
    @scorer = Scorer.new
  end

  def add(pins)
    @scorer.add_throw(pins)
    adjust_current_frame(pins)
  end

  def adjust_current_frame(pins)
    if last_ball_in_frame(pins)
        advance_frame
        @firstthrowinframe = true
    else
      @firstthrowinframe = false
    end

  end

  def last_ball_in_frame(pins)
    strike?(pins) || @firstthrowinframe == false
  end

  def strike?(pins)
    @firstthrowinframe && pins == 10
  end

  def advance_frame
    @itsCurrentFrame = [11, @itsCurrentFrame+1].min
  end

  def calculate_score
    @scorer.score_for_frame(@itsCurrentFrame-1)
  end

end