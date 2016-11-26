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

# Eatery.delete_by_name("Le Grill de Gary")

eatery1 = Eatery.new({'name' => 'Le Grill de Gary'})
eatery1.save

eatery2 = Eatery.new({'name' => 'Bobbys Burger Shack'})
eatery2.save

eatery1 = Eatery.new({'name' => 'Hanks Beef Sandwich Emporium'})
eatery3.save


# burger: eatery_id, price, name
burger1 = Burger.new({
  'eatery_id' => Eatery.get_by_name("Le Grill de Gary")['id'].to_i,
  'price' => 10,
  'name' => 'Gigaburger Grillfest'
  })
burger1.save