class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  regexp = /\A(r|p|s)\z/i 
  raise NoSuchStrategyError unless game[0][1] =~ regexp and game[1][1] =~ regexp
  if game[1][1].downcase == game[0][1].downcase
    return game[0]
    
  elsif game[0][1].downcase == 'r'
    if game[1][1].downcase == 'p'
      return game[1]
    else return game[0]; end
    
  elsif game[0][1].downcase == 'p'
    if game[1][1].downcase == 's'
      return game[1]
    else return game[0]; end
    
  elsif game[0][1].downcase == 's'
    if game[1][1].downcase == 'r'
      return game[1]
    else return game[0]; end
  end
end

def rps_tournament_winner(tournament)

  if tournament.first.first.class != String
    tournament[0] = rps_tournament_winner(tournament.first)
    if tournament.last.class != String
      tournament[1] = rps_tournament_winner(tournament.last)
      tournament = rps_tournament_winner(tournament)
    end 
  else
    return rps_game_winner(tournament)
  end
end

puts rps_game_winner([ ["Dave", "P"], ["Armando", "S"] ])[0]
puts rps_tournament_winner([ ["Dave", "P"], ["Armando", "S"] ])[0]
