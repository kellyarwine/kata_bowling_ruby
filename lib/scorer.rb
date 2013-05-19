class Scorer
  attr_accessor :score

  def initialize
    @itsThrows = []
    @index = 0
  end

  def add_throw(pins)
    @itsThrows[@index] = pins
    @index += 1
  end

  def score_for_frame(frame)
    @ball = 0
    current_frame = 1
    score = 0

    while current_frame <= frame
      if strike?
        score += 10 + next_two_balls
        @ball += 1
      elsif spare?
          score += 10 + next_ball
          @ball += 2
      else
        score += two_balls_in_frame
        @ball += 2
      end

      current_frame += 1
    end

    score
  end

  def strike?
    @itsThrows[@ball] == 10
  end

  def spare?
    @itsThrows[@ball] + @itsThrows[@ball+1] == 10
  end

  def two_balls_in_frame
    @itsThrows[@ball] + @itsThrows[@ball+1]
  end

  def next_two_balls
    @itsThrows[@ball+1] + @itsThrows[@ball+2]
  end

  def next_ball
    @itsThrows[@ball+2]
  end

end