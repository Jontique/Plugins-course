

struct CloudPlugin
(	
	fn RemoveSpheres =
	(
		objs = this.GetCloudObjects()
		for o in objs do
		(
			delete o
		)
	),
	
	fn GetCloudObjects =
	(
		objs = #()
		for o in objects do
		(
			if (matchPattern (o.name) pattern:"CloudObject_JPH*") do
			(
				append objs o
			)
		)
		objs
	),
	
	fn CreateModifiers blob = 
	(
		
		rel = Relax()
		rel.Relax_value = 0.4
		rel.iterations = 2
		opt = Optimize() 
		opt.facethreshold1 = 12.0
		
		ts = TurboSmooth()
		
		addModifier blob opt
		addModifier blob ts
		
	),
	
	fn FixScale blob = 
	(
		blob.scale = [0.1, 0.1, 0.1]
		ResetXForm blob
		
	),
	
	fn CreateBlobMesh size =
	(
		objs = this.GetCloudObjects()
		bm = BlobMesh()
		bm.name = uniqueName "CloudObject_JPH_BlobMesh"
		bm.size = size
		bm.tension = 0.4

		for o in objs do
			bm.addBlob o
		
		bm --return
	),
	
	fn CreateSphere s d rmin rmax =
	(
		newSphere = Sphere()
		newSphere.segs = 4
		hide newSphere
		newSphere.name = uniqueName "CloudObject_JPH"
		r = random rmin rmax
		di = 0
		if s != undefined do 
		(
			di = r + s.radius
		)
		newSphere.position = d * di
		newSphere.radius = r
		
		newSphere
	),
	
	fn CreateCloud pcount rmin rmax blobSize:8 =
	(
		this.RemoveSpheres()
		s = undefined
		-- Create spheres
		for i=1 to pcount do
		(
			x = random -1.0 1.0
			y = random -1.0 1.0
			z = random -1.0 1.0
			d = Point3 x y z
			s = CreateSphere s d rmin rmax
		)
		-- Create blob
		blob = this.CreateBlobMesh blobSize
		this.CreateModifiers blob
		this.FixScale blob
		ConvertToMesh blob
	)
)
rollout rRoller1 "Cloud creator" ( --rollouts are basically dropdown menus
	button b1 "Create a cloud object"
	
	on b1 pressed do (
		cp = CloudPlugin()
		cp.CreateCloud 20 1 8 
	)
)


rollFloater = newRolloutFloater "Cloud UI" 300 300 
addRollout rRoller1 rollFloater