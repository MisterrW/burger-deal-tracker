require_relative('../db/sql_runner.rb')

class Eatery
  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def self.all
    sql = "
    SELECT * FROM eateries
    ;"
    result = SqlRunner.run(sql)
    eateries = result.map{|hash| Eatery.new(hash)}
  end

  def self.delete_all
    sql = "
    DELETE FROM eateries
    ;"
    result = SqlRunner.run(sql)
  end
end