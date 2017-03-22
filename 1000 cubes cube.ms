--creates a cube of cubes (10x10x10)

for i = 1 to 10 do 
(
	for j = 1 to 10 do 
	(
		for k = 1 to 10 do (

		b = box()
		b.width = 1
		b.height = 1
		b.length = 1
		b.position.x = i * 1.5
		b.position.y = j * 1.5
		b.position.z = k * 1.5
		)
	)
)