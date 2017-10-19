return {
	cordship = {
		activatewhenbuilt = true,
		airsightdistance = 320,
		autoheal = 1.5,
		blocking = true,
		buildcostenergy = 900,
		buildcostmetal = 150,
		buildpic = "CORDSHIP.DDS",
		buildtime = 1.5 * 2900,
		canmove = true,
		category = "ALL NOTLAND MOBILE WEAPON NOTSUB SHIP NOTAIR NOTHOVER LIGHTBOAT SURFACE",
		collisionvolumeoffsets = "0 -4 0",
		collisionvolumescales = "26 26 65",
		collisionvolumetype = "CylZ",
		corpse = "DEAD",
		description = "Light Torpedo Corvette",
		energymake = 0.2,
		energyuse = 0.2,
		explodeas = "mediumExplosionGeneric",
		floater = true,
		footprintx = 2,
		footprintz = 4,
		icontype = "sea",
		idleautoheal = 2,
		idletime = 900,
		maxdamage = 480,
		minwaterdepth = 6,
		movementclass = "BOAT42X4",
		name = "Chaser",
		nochasecategory = "VTOL UNDERWATER",
		objectname = "CORDSHIP",
		seismicsignature = 0,
		selfdestructas = "mediumExplosionGenericSelfd",
		sightdistance = 320,
		sonardistance = 270,
		waterline = 1.5,
		acceleration = 3.03/120,
		brakerate = 3.03/25,
		maxvelocity = 3.03,
		turninplace = true,
		turninplaceanglelimit = 110,
		turninplacespeedlimit = 0.64*3.03,
		turnrate = 253,
		customparams = {
			
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "0.255500793457 0.0 -1.26264953613",
				collisionvolumescales = "20.0704803467 16.0 67.0992736816",
				collisionvolumetype = "Box",
				damage = 250,
				description = "Chaser Wreckage",
				energy = 0.8*0,
				featuredead = "HEAP",
				footprintx = 1,
				footprintz = 3,
				height = 4,
				hitdensity = 100,
				metal = 0.8*55,
				object = "CORDSHIP_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 516,
				description = "Chaser Heap",
				energy = 0.8*0,
				footprintx = 3,
				footprintz = 3,
				height = 4,
				hitdensity = 100,
				metal = 0.8*27,
				object = "3X3A",
                collisionvolumescales = "55.0 4.0 6.0",
                collisionvolumetype = "cylY",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = { 
 			pieceExplosionGenerators = { 
				"deathceg2",
				"deathceg3",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
			cant = {
				[1] = "cantdo4",
			},
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			ok = {
				[1] = "sharmmov",
			},
			select = {
				[1] = "sharmsel",
			},
		},
		weapondefs = {
			advdepthcharge = {
				areaofeffect = 12,
				avoidfeature = false,
				avoidfriendly = false,
				burnblow = true,
				collidefriendly = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.8,
				explosiongenerator = "custom:FLASH4",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				model = "torpedo",
				name = "CruiserDepthCharge",
				noselfdamage = true,
				range = 270,
				reloadtime = 0.8,
				soundhit = "xplodep2",
				soundstart = "torpedo1",
				startvelocity = 110,
				tolerance = 32767,
				tracks = true,
				turnrate = 1.5*9800,
				turret = true,
				waterweapon = true,
				weaponacceleration = 15,
				weapontimer = 10,
				weapontype = "TorpedoLauncher",
				weaponvelocity = 200,
				damage = {
					default = 54,
					lboats = 54,
					hvyboats = 48,
					--subs = 110,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "LIGHTAIRSCOUT SHIP",
				def = "ADVDEPTHCHARGE",
				onlytargetcategory = "NOTHOVER",
			},
		},
	},
}
