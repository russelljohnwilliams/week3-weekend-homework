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
    team = @runner.run( sql ).first
    return Team.new(team, @runner)
  end

  def self.delete_all(runner)
    sql = "DELETE FROM teams"
    runner.run(sql)
  end

end
