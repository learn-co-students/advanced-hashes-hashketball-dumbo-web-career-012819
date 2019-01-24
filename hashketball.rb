require 'pry'
#hash = {"key" => "value"}

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
    :players =>
      {
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

  def num_points_scored(name)
    game_hash.each do |team, data|
      data[:players].each do |player_name, stats|
        if name == player_name
        return stats[:points]
        end
      end
    end
  end

  
  def shoe_size(name)
    game_hash.each do |team, data|
     data[:players].each do |player_name, stats|
       if name == player_name
         return stats[:shoe]
       end
     end
    end
  end
  
  def team_colors(team_name)
    game_hash.each do |team, data|
     data[:team_name]
      if team_name == data[:team_name]
        return data[:colors]
      end
     end
    end
   
  
  def team_names
    # difference between map & .each .. return value is different. map will return an array. .each returns the element.
    game_hash.values.map{|team| team.fetch(:team_name)}
  end
  
  def player_numbers(team_name)
    empty = []
    game_hash.each do |team, data|
      if data[:team_name] == team_name #checking the team_name key with team_name argument. If it's in the right key, then it can move forawrd with the if statement data.
      data[:players].map do |a| 
      empty << a[1].fetch(:number) #a is the player and [1] is the stats of the player
      end
    end
    end
    empty
   end
  
  def player_stats(player_name)
    stats = game_hash.values.map{|team| team.fetch(:players)}
    stats.each do |stat_of_players| # the stats of players (key and value)
      stat_of_players.each do |player| #player is name of player and their stats
        if player[0] == player_name
        return player[1] #player[1] is player without it's name. it's returning just the value
        end
        end
     end
  end
  
  def big_shoe_rebounds
    players = []
   game_hash.each do |team, data|
      data[:players].each do |a|
        players << a
      #trying to get all the player to one big hash so that it can be sorted.
      end
   end
    size = players.sort_by do |player|
      player[1].fetch(:shoe)
    end
    size.last[1].fetch(:rebounds) #size.last #it's sorted and the largest is the last element
  end
  
  
  
  
