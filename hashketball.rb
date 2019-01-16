# Write your code here!
require 'pry'
def game_hash
  game_hash = { :home => {                          # first level hash
                :team_name => "Brooklyn Nets",     # 2nd level... team name hash
                :colors => ["Black", "White"],      # 2nd level... array of colors
                :players => {                       # 2nd level... hash of player names
                    "Alan Anderson" => {            # 3rd level... Alan Anderson's stats
                        :number => 0,
                        :shoe => 16,
                        :points => 22,
                        :rebounds => 12,
                        :assists => 12,
                        :steals => 3,
                        :blocks => 1,
                        :slam_dunks => 1
                    },

                    "Reggie Evans" => {            # 3rd level... Reggie Evans' stats
                        :number => 30,
                        :shoe => 14,
                        :points => 12,
                        :rebounds => 12,
                        :assists => 12,
                        :steals => 12,
                        :blocks => 12,
                        :slam_dunks => 7
                     },

                    "Brook Lopez" => {              # 3rd level... Brook Lopez's stats
                        :number => 11,
                        :shoe => 17,
                        :points => 17,
                        :rebounds => 19,
                        :assists => 10,
                        :steals => 3,
                        :blocks => 1,
                        :slam_dunks => 15
                    },

                    "Mason Plumlee" => {            # 3rd level... Mason Plumlee's stats
                        :number => 1,
                        :shoe => 19,
                        :points => 26,
                        :rebounds => 12,
                        :assists => 6,
                        :steals => 3,
                        :blocks => 8,
                        :slam_dunks => 5
                    },

                    "Jason Terry" => {              # 3rd level... Jason Terry's stats
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

                :away => {                          # 1st Level away
                :team_name => "Charlotte Hornets", # 2nd level... team name hash
                :colors => ["Turquoise", "Purple"], # 2nd level... team colors
                :players => {                       # 2nd level... hash of player names
                    "Jeff Adrien" => {              # 3rd level... Jeff Adrien's stats
                        :number => 4,
                        :shoe => 18,
                        :points => 10,
                        :rebounds => 1,
                        :assists => 1,
                        :steals => 2,
                        :blocks => 7,
                        :slam_dunks => 2
                    },

                    "Bismak Biyombo" => {         # 3rd level... Bismak Biyombo stats
                        :number => 0,
                        :shoe => 16,
                        :points => 12,
                        :rebounds => 4,
                        :assists => 7,
                        :steals => 7,
                        :blocks => 15,
                        :slam_dunks => 10
                    },

                    "DeSagna Diop" => {           # 3rd level... DeSanga Diop stats
                        :number => 2,
                        :shoe => 14,
                        :points => 24,
                        :rebounds => 12,
                        :assists => 12,
                        :steals => 4,
                        :blocks => 5,
                        :slam_dunks => 5
                    },

                    "Ben Gordon" => {             # 3rd level... Ben Gordon's stats
                        :number => 8,
                        :shoe => 15,
                        :points => 33,
                        :rebounds => 3,
                        :assists => 2,
                        :steals => 1,
                        :blocks => 1,
                        :slam_dunks => 0
                    },

                    "Brendan Haywood" => {        # 3rd level... Brenden Haywood's stats
                        :number => 33,
                        :shoe => 15,
                        :points => 6,
                        :rebounds => 12,
                        :assists => 12,
                        :steals => 22,
                        :blocks => 5,
                        :slam_dunks => 12}       # Closes Brendan's stats
                }                               # Closes Players level
              }                                 # Closes away level
            }                                   # Closes 1st level game hash

end
game_hash


def num_points_scored(player_name)
  # iterates over the home and away players level
  # for each player... if the key value of player
  # equals the parameter passed in, return the
  # number of points for that specific player
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



def shoe_size (player_name)
  # similar to points scored method
  game_hash[:home][:players].each do |player, size|
      if player_name == player
          return game_hash[:home][:players][player][:shoe]
      end

      game_hash[:away][:players].each do |player, size|
        if player_name == player
          return game_hash[:away][:players][player][:shoe]
        end
      end
  end

end


def team_colors (name)
  # passes in a name.. if name equals either home or away
  # return the corresponding color
  if game_hash[:home][:team_name].to_s == name
     game_hash[:home][:colors]

  elsif game_hash[:away][:team_name].to_s == name
     game_hash[:away][:colors]
  end
  end




def team_names

  # sets up empty array
  team_names_arr = []
  # adds home team name into the array
  team_names_arr << game_hash[:home][:team_name]
  # adds away team name into the array
  team_names_arr << game_hash[:away][:team_name]
  # returns full array
  team_names_arr

end


def player_numbers(team)
  # sets up an empty array for jersey numbers
  numbers_on_jersey = []
  # first iteration
  game_hash.collect do |teams, team_info|
    # checks if value of each team name equals team passed in
    if team_info[:team_name] == team
      # if equal then for each player on that team add the value
      # of each number into the empty array we set up
      team_info[:players].each do |name, stats|
        numbers_on_jersey << stats[:number]
      end
    end
  end
  # return the array full of numbers
  numbers_on_jersey
end

def player_stats (ball_player)
  # searches ball players name in the home team
  # if ball player is in home team, we will return
  # the information for that particular ball player
  if game_hash[:home][:players][ball_player]
    return game_hash[:home][:players][ball_player]

  else
    #same for away player
    game_hash[:away][:players][ball_player]
  end
end


def big_shoe_rebounds

  big_shoe = 0
  rebounds = nil
  # first iteration over game_hash
  game_hash.each do |placeholder, data|
    # takes the key values of the players level
    data[:players].each do |player, stats|
      # for each player, takes the stats
      stats.each do |key, value|
        if key == :shoe
          if value > big_shoe
            big_shoe = value
          end
        end
      end

      if stats.each do |key, value|
        if key == :rebounds
          rebounds = value
        end           # closes inner if iteration statement
      end             # closes do statement
    end               # closes outer if iteration statement
  end                 # closes data iteration
  end                 # closes game_hash iteration
rebounds
end                   # closes method

