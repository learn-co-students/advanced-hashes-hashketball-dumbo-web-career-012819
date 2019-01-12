# Write your code here!
require "pry"

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3, 
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12, 
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3, 
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3, 
          :blocks => 8,
          :slam_dunks => 5 
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4, 
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2, 
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7, 
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4, 
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1, 
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22, 
          :blocks => 5,
          :slam_dunks => 12
        }
        
      }
    }
  }
  
end

def num_points_scored(player_name)
  game_hash[:home][:players].each do |player, stats|
    if player_name == player 
      return game_hash[:home][:players][player][:points]
    end
  end
  
  game_hash[:away][:players].each do |player, stats|
    if player_name == player 
      return game_hash[:away][:players][player][:points]
    end
  end
  
end

def shoe_size(player_name)
  game_hash[:home][:players].each do |player, stats|
    if player_name == player 
      return game_hash[:home][:players][player][:shoe]
    end
  end
  
  game_hash[:away][:players].each do |player, stats|
    if player_name == player 
      return game_hash[:away][:players][player][:shoe]
    end
  end
end

def team_colors(team)
  if game_hash[:home][:team_name] == team
    return game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == team
    return game_hash[:away][:colors]
  end
end

def team_names
  return [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team_name)
  jerseys = []
  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:players].each do |player, stats|
      jerseys << stats[:number]
    end
  elsif game_hash[:away][:team_name] == team_name
    game_hash[:away][:players].each do |player, stats|
      jerseys << stats[:number]
    end
  end
  return jerseys
end

def player_stats(player)
  game_hash[:home][:players].each do |name, values|
    if player == name
      return values
    end
  end
  game_hash[:away][:players].each do |name, values|
    if player == name
      return values
    end
  end
end

def big_shoe_rebounds
  player_largest_shoes = ""
  shoe_size_home = 0
  shoe_size_away = 0
  player_largest_home = ""
  player_largest_away = ""
  game_hash[:home][:players].each do |player, values|
    if values[:shoe] > shoe_size_home
      shoe_size_home = values[:shoe]
      player_largest_home = player
    end
  end
  game_hash[:away][:players].each do |player, values|
    if values[:shoe] > shoe_size_away
      shoe_size_away = values[:shoe]
      player_largest_away = player
    end
  end
  if shoe_size_home > shoe_size_away
    player_largest_shoes = player_largest_home
    return game_hash[:home][:players][player_largest_shoes][:rebounds]
  elsif shoe_size_away > shoe_size_home
    player_largest_shoes = player_largest_away
    return game_hash[:away][:player][player_largest_shoes][:rebounds]
  end
  
end





