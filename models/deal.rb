require_relative('../db/sql_runner.rb')

class Deal
  attr_reader :name, :id, :eatery_id, :day_id, :description
  
  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
    @eatery_id = options['eatery_id'].to_i
    @day_id = options['day_id'].to_i
    @description = options['description']
  end

  def save
    sql = "
    INSERT INTO deals
    (eatery_id, day_id, description, name)
    VALUES
    (#{@eatery_id}, #{@day_id}, '#{@description}', '#{@name}')
    RETURNING *
    ;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.all
    sql = "
    SELECT * FROM deals
    ;"
    result = SqlRunner.run(sql)
    deals = result.map{|hash| Deal.new(hash)}
    return deals
  end

  def self.get_by_name(name)
    sql = "
    SELECT * FROM deals
    WHERE name = '#{name}'
    ;"
    result = SqlRunner.run(sql)
    return result[0]
  end

  def self.delete_all
    sql = "
    DELETE FROM deals
    ;"
    result = SqlRunner.run(sql)
    return result
  end

  def self.by_deal_type(deal_type)
  end

end