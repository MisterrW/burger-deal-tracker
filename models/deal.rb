require_relative('../db/sql_runner.rb')

class Deal
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
    binding.pry
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

  def self.all_pretty
    all_deals = []
    sql = '
    SELECT e.name AS "eatery", e.id AS "eatery_id", b.name AS "burger", d.name AS "deal", d.description AS "details", y.name AS "day", y.id AS "day_id"
    FROM eateries e
    INNER JOIN burgers b
    ON b.eatery_id = e.id
    LEFT JOIN burgers_deals bd
    ON bd.burger_id = b.id
    LEFT JOIN deals d
    ON bd.deal_id = d.id
    INNER JOIN days y
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

  def self.by_day(day_id)
    deals = []
    all_deals = self.all_pretty()
    all_deals.each do |deal|
      if deal['day_id'] == day_id
        deals << deal
      end
    end
    return deals
  end

  def self.by_eatery(eatery_id)
    deals = []
    all_deals = self.all_pretty()
    all_deals.each do |deal|
      if deal['eatery_id'] == eatery_id
        deals << deal
      end
    end
    return deals
  end

  def self.by_deal_type(deal_type)
  end

end