require_relative( 'models/team' )
require_relative( 'models/match' )
require_relative( 'db/sql_runner' )
require( 'pry-byebug' )

runner = SqlRunner.new({dbname: 'dodgeball', host: 'localhost'})

Match.delete_all(runner)
Team.delete_all(runner)

team1 = Team.new({"name" => "Artful Dodgers"}, runner).save

team2 = Team.new({"name" => "Ball Breakers"}, runner).save

team3 = Team.new({"name" => "Diddly Dodge"}, runner).save

team4 = Team.new({"name" => "Dodgeball Dandies"}, runner).save

match1 = Match.new({"home_team_id" => team1.id, "away_team_id" => team2.id, "home_team_score" => 3, "away_team_score" => 7}, runner).save

match2 = Match.new({"home_team_id" => team3.id, "away_team_id" => team4.id, "home_team_score" => 6, "away_team_score" => 2}, runner).save

match3 = Match.new({"home_team_id" => team2.id, "away_team_id" => team3.id, "home_team_score" => 8, "away_team_score" => 10}, runner).save

match4 = Match.new({"home_team_id" => team4.id, "away_team_id" => team1.id, "home_team_score" => 7, "away_team_score" => 7}, runner).save

match5 = Match.new({"home_team_id" => team2.id, "away_team_id" => team4.id, "home_team_score" => 9, "away_team_score" => 4}, runner).save

match6 = Match.new({"home_team_id" => team1.id, "away_team_id" => team3.id, "home_team_score" => 11, "away_team_score" => 2}, runner).save

# team2.list_matches_by_team_id()

binding.pry
nil


#shows all info from a home or away game for team with id 2 

# SELECT * FROM matches INNER JOIN teams ON matches.home_team_id = teams.id OR matches.away_team_id = teams.id WHERE teams.id = #{@id};

# shows all info from a home game for team with id ???

# "SELECT * FROM matches INNER JOIN teams ON matches.home_team_id = teams.id WHERE matches.home_team_id = 1;""



# SELECT teams.name, matches.home_team_score FROM matches INNER JOIN teams ON matches.home_team_id = teams.id OR matches.away_team_id = teams.id WHERE teams.id = #{@id};
