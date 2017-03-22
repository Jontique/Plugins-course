rollout rRoller1 "Metropolia" (

	label lbl1  "Boxes"

	spinner boxCount  "Count of boxes" range:[1, 100, 5] type:#integer
	spinner boxSpacing "Spacing of boxes" range:[1, 10, 5] type:#integer
	
	
	button b1 "Create"
	
	on b1 pressed do (
		--format "%\n" boxSpacing.value
		for i = 1 to boxCount.value do 
			(
		b = box()
		b.width = 1
		b.height = 1
		b.length = 1
		b.position.x = i * (boxSpacing.value)
			)
	)
)
rollFloater = newRolloutFloater "Metropolia" 300 300 --class instances, has to be new
addRollout rRoller1 rollFloater