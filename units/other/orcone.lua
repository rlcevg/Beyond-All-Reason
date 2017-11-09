return {
	orcone = {
		acceleration = 0.108,
		brakerate = 0.714,
		buildcostenergy = 630000,
		buildcostmetal = 38000,
		buildpic = "ORCONE.DDS",
		buildtime = 500000,
		canmove = true,
		category = "KBOT WEAPON ALL NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE",
		collisionvolumeoffsets = "0 -9 0",
		collisionvolumescales = "104 106 68",
		collisionvolumetype = "Ell",
		corpse = "DEAD",
		description = "Shielded Experimental Assault Mech",
		energymake = 40,
		energystorage = 500,
		energyuse = 0,
		explodeas = "smallNukeExplosionGeneric",
		footprintx = 5,
		footprintz = 5,
		icontype = "orcone",
		idleautoheal = 30,
		idletime = 0,
		maxdamage = 90000,
		maxslope = 17,
		maxvelocity = 1.426,
		maxwaterdepth = 12,
		movementclass = "VKBOT5",
		name = "Orcone",
		nochasecategory = "VTOL",
		objectname = "ORCONE",
		radardistance = 0,
		seismicsignature = 100,
		selfdestructas = "smallNukeExplosionGeneric",
		selfdestructcountdown = 10,
		sightdistance = 910,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0.94116,
		turnrate = 396,
		upright = true,
		customparams = {
			
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "arm_corpses",
				collisionvolumeoffsets = "-5.82859039307 -5.26144641113 24.3969650269",
				collisionvolumescales = "96.1643829346 64.7911071777 125.082168579",
				collisionvolumetype = "Box",
				damage = 429000,
				description = "Wreckage",
				featuredead = "HEAP",
				featurereclamate = "smudge01",
				footprintx = 4,
				footprintz = 4,
				height = 60,
				hitdensity = 150,
				metal = 16645.19922,
				object = "orcone_dead",
				reclaimable = true,
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 429000,
				description = "Wreckage",
				featurereclamate = "smudge01",
				footprintx = 3,
				footprintz = 3,
				height = 2,
				hitdensity = 105,
				metal = 8322.59961,
				object = "5x5a",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "tree1reclamate",
				world = "All Worlds",
			},
		},
		sfxtypes = { 
 			pieceExplosionGenerators = { 
				"deathceg2",
				"deathceg3",
				"deathceg4",
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
				[1] = "krogok1",
			},
			select = {
				[1] = "krogsel1",
			},
		},
		weapondefs = {
			orcone_gun = {
				accuracy = 300,
				alphadecay = 0.7,
				areaofeffect = 24,
				avoidfeature = false,
				burnblow = true,
				burst = 3,
				burstrate = 0.09,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:genericshellexplosion-medium",
				impulseboost = 0,
				impulsefactor = 0.4,
				intensity = 0.7,
				interceptedbyshieldtype = 0,
				name = "SuperEMG",
				noselfdamage = true,
				range = 600,
				reloadtime = 0.28,
				rgbcolor = "1 0.95 0.4",
				separation = 1.5,
				soundhit = "xplomed4",
				soundhitwet = "splshbig",
				soundhitwetvolume = 0.5,
				soundstart = "Krogun1",
				sprayangle = 300,
				stages = 10,
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 900,
				damage = {
					bombers = 55,
					default = 400,
					fighters = 55,
					subs = 5,
					vtol = 55,
				},
			},
			orcone_head = {
				accuracy = 1000,
				areaofeffect = 192,
				avoidfeature = false,
				burnblow = true,
				canattackground = false,
				craterareaofeffect = 192,
				craterboost = 0,
				cratermult = 0,
				cylindertargeting = 1,
				edgeeffectiveness = 0.85,
				explosiongenerator = "custom:genericshellexplosion-medium-aa",
				gravityaffected = "true",
				impulseboost = 0,
				impulsefactor = 0,
				name = "FlakCannon",
				size = 4.5,
				noselfdamage = true,
				range = 775,
				reloadtime = 0.55,
                rgbcolor = {1, 0.5, 0.7},
				soundhit = "flakhit",
				soundhitwet = "splslrg",
				soundhitwetvolume = 0.5,
				soundstart = "flakfire",
				turret = true,
				weapontimer = 1,
				weapontype = "Cannon",
				weaponvelocity = 1550,
				damage = {
					bombers = 250,
					fighters = 250,
					vtol = 250,
				},
                customparams = {
                    light_color = "1 0.5 0.6",
                    expl_light_color = "1 0.4 0.5",
                },
			},
			orcone_rocket = {
				areaofeffect = 160,
				avoidfeature = false,
				craterareaofeffect = 160,
				craterboost = 0.4,
				cratermult = 0.4,
				edgeeffectiveness = 0.75,
				cegTag = "missiletrailmedium",
				explosiongenerator = "custom:genericshellexplosion-medium",
				firestarter = 55,
				impulseboost = 0,
				impulsefactor = 0.8,
				interceptedbyshieldtype = 2,
				metalpershot = 0,
				model = "exphvyrock",
				name = "RiotRockets",
				noselfdamage = true,
				proximitypriority = -2,
				range = 900,
				reloadtime = 1.55,
				smoketrail = false,
				soundhit = "xplomed2",
				soundhitwet = "splslrg",
				soundhitwetvolume = 0.5,
				soundstart = "rapidrocket3",
				startvelocity = 150,
				texture1 = "trans",
				texture2 = "armsmoketrail",
				texture3 = "null",
				weaponacceleration = 100,
				weapontimer = 3,
				weapontype = "StarburstLauncher",
				weaponvelocity = 530,
				damage = {
					default = 300,
					subs = 5,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "ORCONE_GUN",
				onlytargetcategory = "SURFACE",
			},
			[2] = {
				def = "ORCONE_HEAD",
				onlytargetcategory = "VTOL",
			},
			[3] = {
				def = "ORCONE_ROCKET",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
