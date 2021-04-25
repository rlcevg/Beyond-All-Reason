local unitName = Spring.I18N('units.names.armsub')

return {
	armsub = {
		acceleration = 0.04592,
		activatewhenbuilt = true,
		autoheal = 2,
		brakerate = 0.04592,
		buildcostenergy = 3500,
		buildcostmetal = 500,
		buildpic = "ARMSUB.PNG",
		buildtime = 6600,
		canmove = true,
		category = "UNDERWATER ALL MOBILE WEAPON NOTLAND NOTAIR NOTHOVER",
		collisionvolumeoffsets = "0 -4 0",
		collisionvolumescales = "35 17 50",
		collisionvolumetype = "box",
		corpse = "DEAD",
		description = Spring.I18N('units.descriptions.armsub'),
		explodeas = "smallExplosionGeneric-uw",
		footprintx = 3,
		footprintz = 3,
		icontype = "sea",
		idleautoheal = 8,
		idletime = 900,
		maxdamage = 950, --1270, --635
		maxvelocity = 2.1,
		minwaterdepth = 15,
		movementclass = "UBOAT3",
		name = unitName,
		nochasecategory = "VTOL",
		objectname = "Units/ARMSUB.s3o",
		script = "Units/ARMSUB.cob",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericSelfd-uw",
		sightdistance = 400,
		sonardistance = 400,
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 480,
		upright = true,
		waterline = 120,
		customparams = {
			model_author = "FireStorm",
			normaltex = "unittextures/Arm_normal.dds",
			subfolder = "armships",
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "-1.03743743896 -3.82080078154e-06 -0.269828796387",
				collisionvolumescales = "40.4452667236 15.0652923584 47.2016448975",
				collisionvolumetype = "Box",
				damage = 1002,
				description = Spring.I18N('units.dead', { name = unitName }),
				energy = 0,
				featuredead = "HEAP",
				footprintx = 3,
				footprintz = 3,
				height = 4,
				hitdensity = 100,
				metal = 250,
				object = "Units/armsub_dead.s3o",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "55.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 4032,
				description = Spring.I18N('units.heap', { name = unitName }),
				energy = 0,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 125,
				object = "Units/arm3X3A.s3o",
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
				[1] = "suarmmov",
			},
			select = {
				[1] = "suarmsel",
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
				model = "torpedo.s3o",
				name = "Light torpedo launcher",
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
					--commanders = 420,
					default = 342, --455,
					--subs = 126,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "HOVER NOTSHIP",
				def = "TORPEDO",
				maindir = "0 0 1",
				maxangledif = 110,
				onlytargetcategory = "NOTHOVER",
			},
		},
	},
}
