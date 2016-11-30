
class BurgersDeals
  def initialize(options)
    @eatery_id = options['eatery_id'].to_i
    @burger_id = options['burger_id'].to_i
    @deal_id = options['deal_id'].to_i
    @id = options['id'].to_i if options['id']
  end

  def save
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

  def self.all_pretty
    all_deals = []
    sql = '
    SELECT e.name AS "eatery", e.id AS "eatery_id", b.name AS "burger", d.name AS "deal", d.description AS "details", d.id as "deal_id", y.name AS "day", y.id AS "day_id"
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

  def self.all_by_eatery_and_deal
    all_combos = self.all_pretty
    all_by_eatery = all_combos.group_by { |x| x['eatery']}
    all_by_deal = {}
    all_by_eatery.each do |key,value|
      temp_thing = {key => value.group_by {|x| x['deal']}}
      all_by_deal.merge!(temp_thing)
    end
    return all_by_deal
  end

  def self.all_by_day_and_eatery
    all_combos = self.all_pretty
    all_by_day = all_combos.group_by { |x| x['day_id']}
    all_by_eatery = {}
    all_by_day.each do |key,value|
      # value.each do |item|
      #   item.delete('day')
      # end
      temp_thing = {key => value.group_by {|x| x['eatery']}}
      all_by_eatery.merge!(temp_thing)
    end
    return all_by_eatery
  end

  def self.all_by_deal
    all_by_deal = {}
    all_by_eatery = self.all_by_day_and_eatery
    all_by_eatery.each do |key, value|
      value.each do |key2, value2|
      #   value2.each do |item|
      #     item.delete('eatery')
      #     item.delete('eatery_id')
      #   end
        temp_thing = {
          key => {
            key2 => value2.group_by {|x| x['deal']}
            } 
          }
        all_by_deal.merge!(temp_thing)
      end
    end
    return all_by_deal
  end

end