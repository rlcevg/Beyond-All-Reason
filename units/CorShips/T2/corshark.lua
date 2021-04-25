local unitName = Spring.I18N('units.names.corshark')

return {
	corshark = {
		acceleration = 0.05,
		activatewhenbuilt = true,
		brakerate = 0.05,
		buildcostenergy = 14000,
		buildcostmetal = 730,
		buildpic = "CORSHARK.PNG",
		buildtime = 22000,
		canmove = true,
		category = "ALL MOBILE WEAPON NOTLAND NOTAIR NOTHOVER CANBEUW SURFACE EMPABLE",
		collisionvolumeoffsets = "0.5 0 0",
		collisionvolumescales = "20 15 64",
		collisionvolumetype = "box",
		corpse = "DEAD",
		description = Spring.I18N('units.descriptions.corshark'),
		energymake = 0.5,
		energyuse = 0.5,
		explodeas = "mediumExplosionGeneric-uw",
		footprintx = 3,
		footprintz = 3,
		icontype = "sea",
		idleautoheal = 10,
		idletime = 900,
		maxdamage = 1300, --1800, --900,
		maxvelocity = 2.8,
		minwaterdepth = 20,
		movementclass = "UBOAT3",
		name = unitName,
		nochasecategory = "VTOL",
		objectname = "Units/CORSHARK.s3o",
		script = "Units/CORSHARK.cob",
		seismicsignature = 0,
		selfdestructas = "mediumExplosionGenericSelfd-uw",
		sightdistance = 390,
		sonardistance = 525,
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 540,
		upright = true,
		waterline = 40,
		customparams = {
			model_author = "Beherith",
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "corships/t2",
			techlevel = 2,
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "1.25 0.0 0.0374984741211",
				collisionvolumescales = "20.0 15.5 55.0749969482",
				collisionvolumetype = "Box",
				damage = 1362,
				description = Spring.I18N('units.dead', { name = unitName }),
				energy = 0,
				featuredead = "HEAP",
				footprintx = 6,
				footprintz = 6,
				height = 4,
				hitdensity = 100,
				metal = 375,
				object = "Units/corshark_dead.s3o",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 4032,
				description = Spring.I18N('units.heap', { name = unitName }),
				energy = 0,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 187,
				object = "Units/cor2X2A.s3o",
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
			armsmart_torpedo = {
				areaofeffect = 16,
				avoidfeature = false,
				avoidfriendly = false,
				burnblow = true,
				cegtag = "torpedotrail-small",
				collidefriendly = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "custom:genericshellexplosion-medium-uw",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				model = "cortorpedo.s3o",
				name = "Rapid armor-piercing torpedoes",
				noselfdamage = true,
				range = 400,
				reloadtime = 2.8,
				soundhit = "xplodep1",
				soundstart = "torpedo1",
				startvelocity = 150,
				tolerance = 9000,
				tracks = true,
				turnrate = 1000,
				turret = false,
				waterweapon = true,
				weaponacceleration = 10,
				weapontimer = 3,
				weapontype = "TorpedoLauncher",
				weaponvelocity = 200,
				damage = {
					default = 350,
					subs = 600,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "HOVER NOTSHIP",
				def = "ARMSMART_TORPEDO",
				maindir = "0 0 1",
				maxangledif = 180, --110
				onlytargetcategory = "NOTHOVER",
			},
		},
	},
}
