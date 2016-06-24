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

# match1 = Match.new({"name" => "Dodgeball Dandies vs. Artful Dodgers", "home_team_id" => "team1.id",}, runner).save


binding.pry
nil


# "away_team_id" => team2.id, 