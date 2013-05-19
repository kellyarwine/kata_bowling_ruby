class Game
  attr_accessor :score

  def initialize
    @score = 0
    @itsThrows = []
    @index = 0
    @itsCurrentFrame = 1
    @firstthrow = true
  end

  def add(pins)
    @itsThrows[@index] = pins
    @index += 1
    @score += pins
    adjust_current_frame(pins)
  end

  def adjust_current_frame(pins)
    if (@firstthrow == true)
      if pins == 10
        @itsCurrentFrame += 1
      else
        @firstthrow = false
      end
    else
      @firstthrow = true
      @itsCurrentFrame += 1
    end

    @itsCurrentFrame = [11, @itsCurrentFrame].min
  end

  def score_for_frame(frame)
    index = -1
    current_frame = 0
    score = 0

    while current_frame < frame
      # require 'pry'
      # binding.pry

      throw_1 = @itsThrows[index+=1]

      if throw_1 == 10
        score += throw_1 + @itsThrows[index+1] + @itsThrows[index+2]
      else
        throw_2 = @itsThrows[index+=1]
        score += throw_1 + throw_2

        score += @itsThrows[index+1] if throw_1 + throw_2 == 10
      end

      current_frame += 1
    end

    score
  end

  def get_current_frame
    @itsCurrentFrame
  end

  def calculate_score
    score_for_frame(get_current_frame-1)
  end

end