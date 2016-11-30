require_relative('../db/sql_runner.rb')

class Burger
  attr_accessor :name, :price
  attr_reader :eatery_id, :id
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

  def self.all_pretty
    all_deals = []
    sql = '
    SELECT e.name AS "eatery", e.id AS "eatery_id", b.name AS "burger", b.price as "price", d.name AS "deal", d.description AS "details", y.name AS "day", y.id AS "day_id"
    FROM burgers_deals bd
    FULL JOIN burgers b
    ON bd.burger_id = b.id
    FULL JOIN deals d
    ON bd.deal_id = d.id
    FULL JOIN eateries e
    ON b.eatery_id = e.id
    LEFT JOIN days y
    ON d.day_id = y.id
    ;'
    results = SqlRunner.run(sql)
    results.each do |result|
      result['day_id'] = result['day_id'].to_i
      result['eatery_id'] = result['eatery_id'].to_i
      all_deals << result
    end
    return all_deals
  end

  def self.all_by_burger
    all_combos = self.all_pretty
    all_by_burger = all_combos.group_by {|combo| combo['burger']}
    return all_by_burger
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