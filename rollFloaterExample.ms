rollout rRoller1 "Roller1" ( --rollouts are basically dropdown menus
	button b1 "Pharah"
	
	on b1 pressed do (
		messagebox "JUSTICE RAINS FROM ABOVE"
	)
)

rollout rRoller2 "Properties" (
	button b1 "Ana"	--in a separate scope, can use the same name
	button b2 "Reinhardt"
	
	on b2 pressed do (
		print "Justice will be done."
	)
	
)

rollout rRoller3 "Blackwatch" (
	label lbl1 "Reaper"
	button b1 "From the shadows" across:2
	spinner s1 "Eliminations" range:[0, 6, 0]
	
)

rollFloater = newRolloutFloater "Window 1" 300 300 --class instances, has to be new
addRollout rRoller1 rollFloater
addRollout rRoller2 rollFloater
addRollout rRoller3 rollFloater