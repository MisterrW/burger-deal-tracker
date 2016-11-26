require_relative('sql_runner')
require('pry-byebug')

def days 
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

def deal_types
  sql = "
  INSERT INTO deal_types
  (details)
  VALUES
  ('half price'),
  ('burger and a pint')
  ;"
  SqlRunner.run(sql)
end

def eateries
  sql = "
  INSERT INTO eateries
  (name)
  VALUES
  ('Bobbys Burger Shack'),
  ('Hanks Beef Sandwich Emporium')
  ;"
  SqlRunner.run(sql)
end

def eatery_id(eatery_name)
  sql = "SELECT * FROM eateries WHERE name = '#{eatery_name}';"
  result = SqlRunner.run(sql)
  return result[0]['id'].to_i
end

def deal_type_id(description)
  sql = "SELECT * FROM deal_types WHERE details = '#{description}';"
  result = SqlRunner.run(sql)
  return result[0]['id'].to_i
end

def burger_id(burger_name)
  sql = "SELECT * FROM burgers WHERE name = '#{burger_name}';"
  result = SqlRunner.run(sql)
  return result[0]['id'].to_i
end

def deal_id(deal_name)
  sql = "SELECT * FROM deals WHERE name = '#{deal_name}';"
  result = SqlRunner.run(sql)
  return result[0]['id'].to_i
end

def burgers
  bobby_id = eatery_id('Bobbys Burger Shack')
  hank_id = eatery_id('Hanks Beef Sandwich Emporium')
  sql= "
  INSERT INTO burgers
  (name, eatery_id, price)
  VALUES
  ('Bobbys Basic Beef', #{bobby_id}, 10),
  ('Bobbys Big Beef', #{bobby_id}, 15),
  ('Hanks Vegan Surprise', #{hank_id}, 10),
  ('Hanks Heap of Hog', #{hank_id}, 15)
  ;"

  SqlRunner.run(sql)
end

def deals
  hp_id = deal_type_id('half price')
  bp_id = deal_type_id('burger and a pint') 
  bobby_id = eatery_id('Bobbys Burger Shack')
  hank_id = eatery_id('Hanks Beef Sandwich Emporium') 
  sql= "
  INSERT INTO deals
  (name, eatery_id, day_id, deal_type)
  VALUES
  ('Bobbys Budget Bonanza', #{bobby_id}, 3, #{bp_id}),
  ('Hanks Half-Price Happiness', #{hank_id}, 5, #{hp_id})
  ;"

  SqlRunner.run(sql)
end

def burgers_deals(options)
  sql= "
  INSERT INTO burgers_deals
  (eatery_id, burger_id, deal_id)
  VALUES
  (#{options['eatery_id']}, #{options['burger_id']}, #{options['deal_id']})
  ;"

  SqlRunner.run(sql)
end

days()
deal_types()
eateries()
burgers()
deals()

for_bobby = {
  'eatery_id' => eatery_id('Bobbys Burger Shack'),
  'burger_id' => burger_id('Bobbys Basic Beef'),
  'deal_id' => deal_id('Bobbys Budget Bonanza')
}

for_hank = {
  'eatery_id' => eatery_id('Hanks Beef Sandwich Emporium'),
  'burger_id' => burger_id('Hanks Heap of Hog'),
  'deal_id' => deal_id('Hanks Half-Price Happiness')
}

burgers_deals(for_bobby)
burgers_deals(for_hank)

