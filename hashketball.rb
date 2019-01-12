require "pry"

def game_hash
	{
		:home => {
			:team_name => "Brooklyn Nets",
			:colors => ["Black", "White"],
			:players => {
				"Alan Anderson" => {:number => 0,
								   :shoe => 16,
								   :points => 22,
								   :rebounds => 12,
								   :assists => 12,
								   :steals => 3,
								   :blocks => 1,
								   :slam_dunks => 1},
				"Reggie Evans" =>  {:number => 30,
								   :shoe => 14,
								   :points => 12,
								   :rebounds => 12, 
								   :assists => 12,
								   :steals => 12,
								   :blocks => 12,
								   :slam_dunks => 7},
				"Brook Lopez" =>   {:number => 11,
								   :shoe => 17,
								   :points => 17,
								   :rebounds => 19,
								   :assists => 10,
								   :steals => 3,
								   :blocks => 1,
								   :slam_dunks => 15},
				"Mason Plumlee" => {:number => 1,
								   :shoe => 19,
								   :points => 26,
								   :rebounds => 12,
								   :assists => 6,
								   :steals => 3,
								   :blocks => 8,
								   :slam_dunks => 5},
				"Jason Terry" =>   {:number => 31, 
								   :shoe => 15,
								   :points => 19,
								   :rebounds => 2,
								   :assists => 2,
								   :steals => 4,
								   :blocks => 11,
								   :slam_dunks => 1}
			}
		},
		:away => {
			:team_name => "Charlotte Hornets",
			:colors => ["Turquoise", "Purple"],
			:players => {
				"Jeff Adrien" => {:number => 4,
								   :shoe => 18,
								   :points => 10,
								   :rebounds => 1,
								   :assists => 1,
								   :steals => 2,
								   :blocks => 7,
								   :slam_dunks => 2},
				"Bismak Biyombo" =>  {:number => 0,
								   :shoe => 16,
								   :points => 12,
								   :rebounds => 4, 
								   :assists => 7,
								   :steals => 7,
								   :blocks => 15,
								   :slam_dunks => 10},
				"DeSagna Diop" =>   {:number => 2,
								   :shoe => 14,
								   :points => 24,
								   :rebounds => 12,
								   :assists => 12,
								   :steals => 4,
								   :blocks => 5,
								   :slam_dunks => 5},
				"Ben Gordon" => {:number => 8,
								   :shoe => 15,
								   :points => 33,
								   :rebounds => 3,
								   :assists => 2,
								   :steals => 1,
								   :blocks => 1,
								   :slam_dunks => 0},
				"Brendan Haywood" =>   {:number => 33, 
								   :shoe => 15,
								   :points => 6,
								   :rebounds => 12,
								   :assists => 12,
								   :steals => 22,
								   :blocks => 5,
								   :slam_dunks => 12}
			}
		}
	}
end

def num_points_scored(name)
	points = ""
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|	
			if attribute == :players
				data.each do |key, amount|
					if key == name
						amount.each do |k, v|
							if k == :points 
								points = v
							end
						end
					end
				end
			end	
		end
	end
	points
end

def shoe_size(name)
	shoe = ""
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|	
			if attribute == :players
				data.each do |key, amount|
					if key == name
						amount.each do |k, v|
							if k == :shoe 
								shoe = v
							end
						end
					end
				end
			end	
		end
	end
	shoe
end

def team_colors(team_name)
	colors = ""
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if data == team_name
				team_data.each do |a, d|
					if a == :colors
						colors = d
					end
				end
			end
		end
	end
	colors
end

def team_names
	teams = []
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if attribute == :team_name
				teams << data
			end
		end
	end
	teams
end

def player_numbers(team_name)
	p_numbers = []
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if data == team_name
				team_data.each do |a, d|
					if a == :players
						d.each do |k, v|
							v.each do |type, statistic|
								if type == :number
									p_numbers << statistic
								end
							end
						end
					end
				end
			end
		end
	end
	p_numbers
end

def player_stats(name)
	game_hash.each do |location, team_data|
		team_data[:players].each do |k, v|
			if k == name
				return v
			end
		end
	end
end

def big_shoe_rebounds
	shoe_array = []
	final_answer = []
	game_hash.each do |location, team_data|
		team_data[:players].each do |name, stats|
			stats.each do |type, amount|
				if type == :shoe
					shoe_array << amount
				end
			end
			stats.each do |t, a|
				if t == :shoe && a == shoe_array.max
					stats.each do |x, y|
						if x == :rebounds
							return y
						end
					end
				end
			end
		end
	end	
end

=begin	shoe_size = 0
	shoe_array = []
	final_answer = ""
	game_hash.each do |location, team_data|
		team_data[:players].each do |name, stats|
			stats.each do |type, amount|
				if type == :shoe
					shoe_array << amount
				end
			end
			shoe_size = shoe_array.max
			stats.each do |t, a|
				if a == shoe_size
					final_answer << a
					binding.pry
				end
			end
		end
	end
	binding.pry
	final_answer
=end
=begin
binding.pry
			stats.each do |type, amount|
				binding.pry
				if type == :shoe
					shoe_array << amount
					binding.pry
				end
			end
			binding.pry
			shoe_size = shoe_array.max
			stats.each do |t, a|
				if t == :shoe && a == shoe_size
					final_answer << a
					binding.pry
				end
			end
		end
	end
	final_answer.to_i
=end


=begin
	
stats.each do |type, amount|
				if type == :shoe	
					shoe_array << amount
				end
			end

		end
	end
	game_hash.each do |l, td|
		td[:players].each do |n, st|
			st.each do |t, a|
				if t == :&& shoe_array.max == a
					final_answer << a
					
				end
			end
		end
	end
	
	final_answer
=end