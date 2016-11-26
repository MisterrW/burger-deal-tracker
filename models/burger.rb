require_relative('../db/sql_runner.rb')

class Burger
  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
    @eatery_id = options['eatery_id'].to_i
    @price = options['price'].to_i
  end

  def save
    sql = "
    INSERT INTO burgers
    (eatery_id, price, name)
    VALUES
    (#{@eatery_id}, #{@price}, '#{@name}')
    RETURNING *
    ;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.all
    sql = "
    SELECT * FROM burgers
    ;"
    result = SqlRunner.run(sql)
    burgers = result.map{|hash| Burger.new(hash)}
    return burgers
  end

  def self.get_by_name(name)
    sql = "
    SELECT * FROM burgers
    WHERE name = '#{name}'
    ;"
    result = SqlRunner.run(sql)
    return result[0]
  end

  def self.delete_by_name(name)
    sql = "
    DELETE FROM burgers
    WHERE name = '#{name}'
    ;"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "
    DELETE FROM burgers
    ;"
    SqlRunner.run(sql)
  end
end