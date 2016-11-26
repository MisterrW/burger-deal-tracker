
class BurgersDeals
  def initialize(options)
    @eatery_id = options['eatery_id'].to_i
    @burger_id = options['burger_id'].to_i
    @deal_id = options['deal_id'].to_i
    @id = options['id'].to_i if options['id']
  end

  def save
    binding.pry
    sql= "
    INSERT INTO burgers_deals
    (eatery_id, burger_id, deal_id)
    VALUES
    (#{@eatery_id}, #{@burger_id}, #{@deal_id})
    RETURNING *
    ;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

end