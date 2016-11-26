
SELECT e.name, b.name, d.name, t.details, y.name
FROM eateries e
INNER JOIN burgers b
ON b.eatery_id = e.id
INNER JOIN deals d
ON b.eatery_id = e.id
INNER JOIN deal_types t
ON d.deal_type = t.id
INNER JOIN days y
ON d.day_id = y.id;



SELECT e.name, b.name, d.name, t.details, y.name
FROM eateries e
INNER JOIN burgers b
ON b.eatery_id = e.id
LEFT JOIN deals d
ON b.eatery_id = b.eatery_id
INNER JOIN deal_types t
ON d.deal_type = t.id
INNER JOIN days y
ON d.day_id = y.id;


SELECT e.name, b.name, d.name, t.details, y.name
FROM eateries e
INNER JOIN burgers b
ON b.eatery_id = e.id
LEFT JOIN deals d
ON b.eatery_id = b.eatery_id
INNER JOIN deal_types t
ON d.deal_type = t.id
INNER JOIN days y
ON d.day_id = y.id;



SELECT e.name, b.name, d.name, t.details, y.name
FROM eateries e
INNER JOIN burgers b
ON b.eatery_id = e.id
LEFT JOIN burgers_deals bd
ON bd.burger_id = b.id
LEFT JOIN deals d
ON bd.deal_id = d.id
INNER JOIN deal_types t
ON d.deal_type = t.id
INNER JOIN days y
ON d.day_id = y.id
WHERE y.name = 'Friday';


SELECT e.name AS "Eatery", b.name AS "Burger", d.name AS "Deal", t.details AS "Details", y.name AS "Day"
FROM eateries e
INNER JOIN burgers b
ON b.eatery_id = e.id
LEFT JOIN burgers_deals bd
ON bd.burger_id = b.id
LEFT JOIN deals d
ON bd.deal_id = d.id
INNER JOIN deal_types t
ON d.deal_type = t.id
INNER JOIN days y
ON d.day_id = y.id
WHERE y.name = 'Friday';