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

  def self.eateries
    eatery1 = Eatery.new({'name' => 'Le Grille de Gary'})
    eatery1.save

    eatery2 = Eatery.new({'name' => 'Bobbys Burger Shack'})
    eatery2.save

    eatery3 = Eatery.new({'name' => 'Hanks Beef Sandwich Emporium'})
    eatery3.save

    eatery4 = Eatery.new({'name' => 'Grillswitch Engage'})
    eatery4.save

    eatery5 = Eatery.new({'name' => 'Vangelgreases Venison Stop'})
    eatery5.save

    eatery6 = Eatery.new({'name' => 'Deckards Deli'})
    eatery6.save

    eatery7 = Eatery.new({'name' => 'Roy Battys Replicantessen'})
    eatery7.save
  end

  def self.burgers
    burger1 = Burger.new({
      'eatery_id' => Eatery.get_by_name("Le Grille de Gary")['id'].to_i,
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

    burger6 = Burger.new({
      'eatery_id' => Eatery.get_by_name("Grillswitch Engage")['id'].to_i,
      'price' => 13,
      'name' => 'As Daylight Fries'
      })
    burger6.save

    burger5 = Burger.new({
      'eatery_id' => Eatery.get_by_name("Vangelgreases Venison Stop")['id'].to_i,
      'price' => 18,
      'name' => 'Doe ray me'
      })
    burger5.save

    burger5 = Burger.new({
      'eatery_id' => Eatery.get_by_name("Deckards Deli")['id'].to_i,
      'price' => 5,
      'name' => 'Kibble and nibbles'
      })
    burger5.save

    burger5 = Burger.new({
      'eatery_id' => Eatery.get_by_name("Roy Battys Replicantessen")['id'].to_i,
      'price' => 6,
      'name' => 'Questionable things, in a bap'
      })
    burger5.save
  end

  def self.deals
    deal1 = Deal.new({
      'eatery_id' => Eatery.get_by_name("Bobbys Burger Shack")['id'].to_i,
      'description' => 'burger and a pint',
      'day_id' => 3,
      'name' => 'Bobbys Budget Bonanza'
      })
    deal1.save

    deal2 = Deal.new({
      'eatery_id' => Eatery.get_by_name("Hanks Beef Sandwich Emporium")['id'].to_i,
      'description' => 'half price',
      'day_id' => 5,
      'name' => 'Hanks Half-Price Happiness'
      })
    deal2.save

    deal3 = Deal.new({
      'eatery_id' => Eatery.get_by_name("Bobbys Burger Shack")['id'].to_i,
      'description' => 'half price',
      'day_id' => 1,
      'name' => 'Bobbys Half-off Mondays'
      })
    deal3.save

    deal4 = Deal.new({
      'eatery_id' => Eatery.get_by_name("Grillswitch Engage")['id'].to_i,
      'description' => 'Whats your beef?',
      'day_id' => 1,
      'name' => 'Metalcore Mondays'
      })
    deal4.save

    deal5 = Deal.new({
      'eatery_id' => Eatery.get_by_name("Roy Battys Replicantessen")['id'].to_i,
      'description' => 'Burgers as good as we can make them...',
      'day_id' => 7,
      'name' => '...but not to last'
      })
    deal5.save

    deal6 = Deal.new({
      'eatery_id' => Eatery.get_by_name("Vangelgreases Venison Stop")['id'].to_i,
      'description' => 'Free 80s cheese with everything',
      'day_id' => 6,
      'name' => 'Synth Saturdays'
      })
    deal6.save

  end

  def self.burgers_deals
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

    for_vangel1 = BurgersDeals.new({
          'eatery_id' => Eatery.get_by_name("Vangelgreases Venison Stop")['id'].to_i,
          'burger_id' => Burger.get_by_name('Doe ray me')['id'].to_i,
          'deal_id' => Deal.get_by_name('Synth Saturdays')['id'].to_i
          })

    for_vangel1.save

    for_grillswitch1 = BurgersDeals.new({
          'eatery_id' => Eatery.get_by_name("Grillswitch Engage")['id'].to_i,
          'burger_id' => Burger.get_by_name('As Daylight Fries')['id'].to_i,
          'deal_id' => Deal.get_by_name('Metalcore Mondays')['id'].to_i
          })

    for_grillswitch1.save

    for_roy1 = BurgersDeals.new({
          'eatery_id' => Eatery.get_by_name("Roy Battys Replicantessen")['id'].to_i,
          'burger_id' => Burger.get_by_name('Questionable things, in a bap')['id'].to_i,
          'deal_id' => Deal.get_by_name('...but not to last')['id'].to_i
          })

    for_roy1.save
  end

  def self.setup
    Eatery.delete_all!
    self.eateries
    self.burgers
    self.deals
    self.burgers_deals
  end

end