def game_hash
  hashketball = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12,
           assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12,
           assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19,
           assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12,
           assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2,
           assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1,
           assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4,
           assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
        "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12,
           assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3,
           assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12,
           assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      }
    }
  }
end

def num_points_scored(name)
  game_hash.each do |location, team_data|
    players = team_data[:players]
    if players[name] != nil
      return players[name][:points]
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    players = team_data[:players]
    if players[name] != nil
      return players[name][:shoe]
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      colors = team_data[:colors]
      return colors
    end
  end
end

def team_names
  game_hash.collect do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team)
  team_numbers = []

  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data[:players].each do |name, stats|
        team_numbers << stats[:number]
      end
    end
  end

  return team_numbers
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if player == name
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  shoe_size = nil
  rebounds = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      current_size = stats[:shoe]

      if shoe_size == nil || current_size > shoe_size
        shoe_size = current_size
        rebounds = stats[:rebounds]
      end
    end
  end

  return rebounds
end

def most_points_scored
  highest_points = nil
  top_player = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      current_points = stats[:points]

      if highest_points == nil || current_points > highest_points
        highest_points = current_points
        top_player = player
      end
    end
  end

  return top_player
end

def winning_team
  home_team = Hash.new(0)
  away_team = Hash.new(0)

  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      points = stats[:points]
      team_name = team_data[:team_name]

      if location.to_s == "home"
        home_team[team_name] += points
      elsif location.to_s == "away"
        away_team[team_name] += points
      end
    end
  end

  if home_team.values[0] > away_team.values[0]
    return home_team.keys[0]
  else
    return away_team.keys[0]
  end
end

def player_with_longest_name
  longest_name = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if longest_name == nil || player.length > longest_name.length
        longest_name = player
      end
    end
  end

  return longest_name
end
