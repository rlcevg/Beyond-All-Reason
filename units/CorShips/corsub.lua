return {
	corsub = {
		acceleration = 0.0451,
		activatewhenbuilt = true,
		autoheal = 2,
		brakerate = 0.0451,
		buildcostenergy = 3600,
		buildcostmetal = 530,
		buildpic = "CORSUB.PNG",
		buildtime = 6530,
		canmove = true,
		category = "ALL UNDERWATER MOBILE WEAPON NOTLAND NOTAIR NOTHOVER",
		collisionvolumeoffsets = "0 -4 0",
		collisionvolumescales = "35 17 50",
		collisionvolumetype = "box",
		corpse = "DEAD",
		description = "Submarine",
		explodeas = "smallExplosionGeneric-uw",
		footprintx = 3,
		footprintz = 3,
		icontype = "sea",
		idleautoheal = 8,
		idletime = 900,
		maxdamage = 635,
		maxvelocity = 2.15,
		minwaterdepth = 15,
		movementclass = "UBOAT3",
		name = "Snake",
		nochasecategory = "VTOL",
		objectname = "Units/CORSUB.s3o",
		script = "Units/CORSUB.cob",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericSelfd-uw",
		sightdistance = 400,
		sonardistance = 475,
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 460.5,
		upright = true,
		waterline = 30,
		customparams = {
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "corships",
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "2.76780700684 0.0 -0.0",
				collisionvolumescales = "24.2856140137 12.625 49.0312194824",
				collisionvolumetype = "Box",
				damage = 1002,
				description = "Snake Wreckage",
				energy = 0,
				featuredead = "HEAP",
				footprintx = 3,
				footprintz = 3,
				height = 4,
				hitdensity = 100,
				metal = 265,
				object = "Units/corsub_dead.s3o",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "85.0 14.0 6.0",
				collisionvolumetype = "cylY",
				damage = 4032,
				description = "Snake Heap",
				energy = 0,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 132.5,
				object = "Units/cor4X4B.s3o",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = {
			pieceexplosiongenerators = {
				[1] = "deathceg2",
				[2] = "deathceg3",
				[3] = "deathceg4",
			},
			explosiongenerators = {
				[0] = "custom:subbubbles",
				[1] = "custom:subwake",
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
				[1] = "sucormov",
			},
			select = {
				[1] = "sucorsel",
			},
		},
		weapondefs = {
			torpedo = {
				areaofeffect = 64,
				avoidfeature = false,
				avoidfriendly = false,
				burnblow = true,
				cegtag = "torpedotrail-tiny",
				collidefriendly = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "custom:genericshellexplosion-small-uw",
				flighttime = 3,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				model = "cortorpedo.s3o",
				name = "Light homing torpedo launcher",
				noselfdamage = true,
				predictboost = 1,
				range = 500,
				reloadtime = 2.5,
				soundhit = "xplodep1",
				soundstart = "torpedo1",
				startvelocity = 100,
				tolerance = 12000,
				turnrate = 12000,
				turret = false,
				waterweapon = true,
				weaponacceleration = 15,
				weapontimer = 3.25,
				weapontype = "TorpedoLauncher",
				weaponvelocity = 160,
				damage = {
					commanders = 420,
					default = 455,
					subs = 126,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "HOVER NOTSHIP",
				def = "TORPEDO",
				maindir = "0 0 1",
				maxangledif = 90,
				onlytargetcategory = "NOTHOVER",
			},
		},
	},
}
