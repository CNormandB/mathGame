class MathGame
  def initialize(io)
    @io = io
    @players = [Player.new, Player.new]
    @current_player = 0
  end

  def generate_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    { question: "#{num1} + #{num2} =", answer: num1 + num2 }
  end

  def switch_player
    @current_player = (@current_player + 1) % 2
  end

  def game_over?
    @players.any? { |player| player.lives <= 0 }
  end

  def display_scores
    @io.display_scores(@players[0].lives, @players[1].lives)
  end

  def announce_winner
    winner_index = @players.index { |player| player.lives > 0 }
    loser_index = (winner_index + 1) % 2
    @io.announce_winner(winner_index + 1, @players[winner_index].lives, loser_index + 1, @players[loser_index].lives)
  end

  def run
    until game_over?
      question = generate_question
      @io.display_question(@current_player + 1, question[:question])
      answer = @io.get_answer.to_i

      if answer == question[:answer]
        @io.correct_answer
      else
        @io.incorrect_answer
        @players[@current_player].lose_life
      end

      display_scores
      switch_player
    end

    announce_winner
  end
end
