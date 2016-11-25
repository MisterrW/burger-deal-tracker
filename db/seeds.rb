require_relative('sql_runner')

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
  (name)
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
  eatery = SqlRunner.run(sql)
  return eatery[0]['id'].to_i
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
  bobby_id = eatery_id('Bobbys Burger Shack')
  hank_id = eatery_id('Hanks Beef Sandwich Emporium') 
  sql= "
  INSERT INTO deals
  (name, eatery_id, day_id, deal_type)
  VALUES
  ('Bobbys Budget Bonanza', #{bobby_id}, 3, 1),
  ('Hanks Half-Price Happiness', #{hank_id}, 5, 2)
  ;"

  SqlRunner.run(sql)

end

days()
eateries()
burgers()
deals()


