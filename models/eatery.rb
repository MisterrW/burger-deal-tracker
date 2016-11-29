require_relative('../db/sql_runner.rb')

class Eatery
  attr_accessor :name
  attr_reader :id
  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "
    INSERT INTO eateries
    (name)
    VALUES
    ('#{@name}')
    RETURNING *
    ;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.all
    sql = "
    SELECT * FROM eateries
    ;"
    result = SqlRunner.run(sql)
    eateries = result.map{|hash| Eatery.new(hash)}
    return eateries
  end

  def self.get_by_name(name)
    sql = "
    SELECT * FROM eateries
    WHERE name = '#{name}'
    ;"
    result = SqlRunner.run(sql)
    return result[0]
  end

  def self.get_by_id(id)
    id = id.to_i
    sql = "
    SELECT * FROM eateries
    WHERE id = #{id}
    ;"
    result = SqlRunner.run(sql)
    return Eatery.new(result[0])
  end

  def self.delete_by_id!(id)
    sql = "
    DELETE FROM burgers_deals
    WHERE eatery_id = #{id}
    ;
    DELETE FROM burgers
    WHERE eatery_id = #{id}
    ;
    DELETE FROM deals
    WHERE eatery_id = #{id}
    ;"
    SqlRunner.run(sql)

    sql = "
    DELETE FROM eateries
    WHERE id = #{id}
    RETURNING *
    ;"
    result = SqlRunner.run(sql)
    return result
  end

  def self.delete_by_name!(name)
    id = self.get_by_name(name)['id'].to_i
    self.delete_by_id(id)
  end

  def self.delete_all!
    sql = "
    DELETE FROM burgers_deals;
    DELETE FROM burgers;
    DELETE FROM deals;
    DELETE FROM eateries
    ;"
    result = SqlRunner.run(sql)
  end
end