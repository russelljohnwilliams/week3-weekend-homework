require_relative('../db/sql_runner')
require_relative('match')

class Team

attr_reader(:id, :name)

  def initialize( options, runner )
    @id = options['id'].to_i
    @name = options['name']
    @runner = runner
  end


  def save()
    sql = "INSERT INTO teams (name) VALUES ('#{@name}') RETURNING *"
    return Team.map_item(sql, @runner)
  end

  def self.delete_all(runner)
    sql = "DELETE FROM teams"
    runner.run(sql)
  end

  def self.all(runner)
    sql = "SELECT * FROM teams"
    return Team.map_items(sql, runner)
  end

  def self.map_items(sql, runner)
    team = runner.run(sql)
    result = team.map { |team| Team.new(team, runner) }
    return result
  end

  def self.map_item(sql, runner)
    result = Team.map_items(sql, runner)
    return result.first
  end

end
