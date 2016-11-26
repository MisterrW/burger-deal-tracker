
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

  def self.all_by_eatery_and_deal
    all_combos = Deal.all_pretty
    all_by_eatery = all_combos.group_by { |x| x['eatery']}
    all_by_deal = {}
    all_by_eatery.each do |key,value|
      temp_thing = {key => value.group_by {|x| x['deal']}}
      all_by_deal.merge!(temp_thing)
    end
    return all_by_deal
  end

end