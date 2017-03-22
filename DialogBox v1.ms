-- Dialog box


rollout rJontique "Window #1" (
	
	button bButton "Click me!" across:3 --across defines how
	button bButton2 "Click me two!" 		--many elements are
	button bButton3 "Me three!" 				--on the same row
)

CreateDialog rJontique 300 50 --width, height