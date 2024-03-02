class GameIO
  def display_scores(player1_lives, player2_lives)
    puts "Player 1: #{player1_lives} lives | Player 2: #{player2_lives} lives"
  end

  def display_question(player_number, question)
    puts "Player #{player_number}: #{question}"
  end

  def correct_answer
    puts "Correct!"
  end

  def incorrect_answer
    puts "Incorrect!"
  end

  def get_answer
    print "> "
    gets.chomp
  end

  def announce_winner(winner, winner_lives, loser, loser_lives)
    puts "Player #{winner} wins with #{winner_lives} lives remaining!"
    puts "Player #{loser} scored #{loser_lives}"
  end
end