-- for i = 1 to 10 do 
-- (
-- 	for j = 1 to 10 do 
-- 	(
-- 		b = box()
-- 		b.width = 5
-- 		b.height = 5
-- 		b.length = 5
-- 		b.position.x = sin(i*j) * 100
-- 		b.position.y = i * 5.5
-- 		b.position.z = j * 5.5
-- 		
-- 	)
-- )
for i = 1 to 40 do 
(
	for j = 1 to 10 do 
	(
		b = box()
		b.width = 5
		b.height = 5
		b.length = 5
		b.position.x = i *5
		b.position.y = sin(i*20) * 20
		b.position.z = j * 5
		
	)
)

