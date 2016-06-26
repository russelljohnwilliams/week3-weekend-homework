require_relative('../db/sql_runner')
require_relative('team')

class Match

  attr_reader(:id, :team_id, :home_team_id, :away_team_id, :home_team_score, :away_team_score)

  def initialize (options, runner)
    @id = options['id'].to_i
    @home_team_id = options['home_team_id'].to_i
    @away_team_id = options['away_team_id'].to_i
    @home_team_score = options['home_team_score'].to_i
    @away_team_score = options['away_team_score'].to_i
    @runner = runner
  end

  def save()
    sql = "INSERT INTO matches (home_team_id, away_team_id, home_team_score, away_team_score) VALUES ('#{@home_team_id}', '#{@away_team_id}', '#{@home_team_score}', '#{@away_team_score}') RETURNING *"
    return Match.map_item(sql, @runner)
  end

  def self.delete_all(runner)
    sql = "DELETE FROM matches"
    runner.run(sql)
  end

  def self.all(runner)
    sql = "SELECT * FROM matches"
    return Match.map_items(sql, runner)
  end

  def self.map_items(sql, runner)
    match = runner.run(sql)
    result = match.map { |match| Match.new(match, runner) }
    return result
  end

  def self.map_item(sql, runner)
    result = Match.map_items(sql, runner)
    return result.first
  end


  def show_all_scores()
    sql = "SELECT home.name as home_team_name, matches.home_team_score, matches.away_team_score, away.name as away_team_name FROM matches INNER JOIN teams home ON matches.home_team_id = home.id INNER JOIN teams away ON matches.away_team_id = away.id;"
      matches = @runner.run(sql)
      result =  matches.map {|match| match }
      print result
    end


end








