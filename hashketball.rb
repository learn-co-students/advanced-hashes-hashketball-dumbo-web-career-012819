require 'pry'

def game_hash
  teams = {
      home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
          "Jeff Adrien" => {
            number: 4,
            shoe: 18,
            points: 10,
            rebounds: 1,
            assists: 1,
            steals: 2,
            blocks: 7,
            slam_dunks: 2
          },
          "Bismak Biyombo" => {
            number: 0,
            shoe: 16,
            points: 12,
            rebounds: 4,
            assists: 7,
            steals: 7,
            blocks: 15,
            slam_dunks: 10
          },
          "DeSagna Diop" => {
            number: 2,
            shoe: 14,
            points: 24,
            rebounds: 12,
            assists: 12,
            steals: 4,
            blocks: 5,
            slam_dunks: 5
          },
          "Ben Gordon" => {
            number: 8,
            shoe: 15,
            points: 33,
            rebounds: 3,
            assists: 2,
            steals: 1,
            blocks: 1,
            slam_dunks: 0
          },
          "Brendan Haywood" => {
            number: 33,
            shoe: 15,
            points: 6,
            rebounds: 12,
            assists: 12,
            steals: 22,
            blocks: 5,
            slam_dunks: 12
          }
        }
     }
  }
end

def num_points_scored player
  foundPlayer = nil
  game_hash.each do |location, team_data|
    if team_data[:players][player]
       foundPlayer = team_data[:players][player][:points]
     end
  end
  foundPlayer
end

def shoe_size player
  foundPlayer = nil
  game_hash.each do |location, team_data|
    if team_data[:players][player]
       foundPlayer = team_data[:players][player][:shoe]
     end
  end
  foundPlayer
end

def team_colors team_name
  foundColors = nil
  game_hash.each do |location, team_data|
      if team_data[:team_name] == team_name
        foundColors = team_data[:colors]
      end
    end
  foundColors
end

def team_names
  teams = []
  game_hash.each do |location, team_data|
      teams.push(team_data[:team_name])
  end
  teams
end

def player_numbers teams
  jerseyNums = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == teams
      team_data[:players].each do |key, value|
        value.each do |stat, number|
          if stat == :number
            jerseyNums.push(number)
          end
        end
      end
    end
  end
  jerseyNums
end

def player_stats player
  stats = nil
  game_hash.each do |location, team_data|
      if team_data[:players][player]
        stats = team_data[:players][player]
      end
  end
  stats
end

def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      stats.each do |stat, value|
        if stat == :shoe
          if value > biggest_shoe
            biggest_shoe = value
          end
        end
      end

      if stats[:shoe] == biggest_shoe
        stats.each do |stat, value|
          if stat == :rebounds
            rebounds = value
          end
        end
      end
    end
  end

  rebounds
end

big_shoe_rebounds
