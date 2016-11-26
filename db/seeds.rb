require_relative('sql_runner')
require('pry-byebug')

class Seeds

  def self.days 
    sql = "
    INSERT INTO days
    (id, name)
    VALUES
    (1, 'Monday'),
    (2, 'Tuesday'),
    (3, 'Wednesday'),
    (4, 'Thursday'),
    (5, 'Friday'),
    (6, 'Saturday'),
    (7, 'Sunday')
    ;"
    SqlRunner.run(sql)
  end

  def self.setup

    Eatery.delete_all!

    # eateries

    eatery1 = Eatery.new({'name' => 'Le Grill de Gary'})
    eatery1.save

    eatery2 = Eatery.new({'name' => 'Bobbys Burger Shack'})
    eatery2.save

    eatery3 = Eatery.new({'name' => 'Hanks Beef Sandwich Emporium'})
    eatery3.save

    # burgers

    burger1 = Burger.new({
      'eatery_id' => Eatery.get_by_name("Le Grill de Gary")['id'].to_i,
      'price' => 10,
      'name' => 'Gigaburger Grillfest'
      })
    burger1.save

    burger2 = Burger.new({
      'eatery_id' => Eatery.get_by_name("Bobbys Burger Shack")['id'].to_i,
      'price' => 10,
      'name' => 'Bobbys Basic Beef'
      })
    burger2.save

    burger3 = Burger.new({
      'eatery_id' => Eatery.get_by_name("Bobbys Burger Shack")['id'].to_i,
      'price' => 15,
      'name' => 'Bobbys Big Beef'
      })
    burger3.save

    burger4 = Burger.new({
      'eatery_id' => Eatery.get_by_name("Hanks Beef Sandwich Emporium")['id'].to_i,
      'price' => 10,
      'name' => 'Hanks Vegan Surprise'
      })
    burger4.save

    burger5 = Burger.new({
      'eatery_id' => Eatery.get_by_name("Hanks Beef Sandwich Emporium")['id'].to_i,
      'price' => 15,
      'name' => 'Hanks Heap of Hog'
      })
    burger5.save

    # deals

    def self.deal_type_id(description)
      sql = "SELECT * FROM deal_types WHERE details = '#{description}';"
      result = SqlRunner.run(sql)
      return result[0]['id'].to_i
    end


    deal1 = Deal.new({
      'eatery_id' => Eatery.get_by_name("Bobbys Burger Shack")['id'].to_i,
      'deal_type' => self.deal_type_id('burger and a pint'),
      'day_id' => 3,
      'name' => 'Bobbys Budget Bonanza'
      })
    deal1.save

    deal2 = Deal.new({
      'eatery_id' => Eatery.get_by_name("Hanks Beef Sandwich Emporium")['id'].to_i,
      'deal_type' => self.deal_type_id('half price'),
      'day_id' => 5,
      'name' => 'Hanks Half-Price Happiness'
      })
    deal2.save

    deal3 = Deal.new({
      'eatery_id' => Eatery.get_by_name("Bobbys Burger Shack")['id'].to_i,
      'deal_type' => self.deal_type_id('half price'),
      'day_id' => 1,
      'name' => 'Bobbys Half-off Mondays'
      })
    deal3.save
    # join table

    for_bobby1 = BurgersDeals.new({
      'eatery_id' => Eatery.get_by_name("Bobbys Burger Shack")['id'].to_i,
      'burger_id' => Burger.get_by_name('Bobbys Basic Beef')['id'].to_i,
      'deal_id' => Deal.get_by_name('Bobbys Budget Bonanza')['id'].to_i
    })

    for_bobby1.save

    for_bobby2 = BurgersDeals.new({
      'eatery_id' => Eatery.get_by_name("Bobbys Burger Shack")['id'].to_i,
      'burger_id' => Burger.get_by_name('Bobbys Basic Beef')['id'].to_i,
      'deal_id' => Deal.get_by_name('Bobbys Half-off Mondays')['id'].to_i
    })

    for_bobby2.save

    for_hank1 = BurgersDeals.new({
      'eatery_id' => Eatery.get_by_name("Hanks Beef Sandwich Emporium")['id'].to_i,
      'burger_id' => Burger.get_by_name('Hanks Heap of Hog')['id'].to_i,
      'deal_id' => Deal.get_by_name('Hanks Half-Price Happiness')['id'].to_i
    })

    for_hank1.save

    for_hank2 = BurgersDeals.new({
      'eatery_id' => Eatery.get_by_name("Hanks Beef Sandwich Emporium")['id'].to_i,
      'burger_id' => Burger.get_by_name('Hanks Vegan Surprise')['id'].to_i,
      'deal_id' => Deal.get_by_name('Hanks Half-Price Happiness')['id'].to_i
    })

    for_hank2.save

  end
end