return {
	armfig = {
		acceleration = 0.30,
		airsightdistance = 950,
		brakerate = 0.075,
		buildcostenergy = 2800,
		buildcostmetal = 70,
		buildpic = "ARMFIG.DDS",
		buildtime = 3500,
		canfly = true,
		canmove = true,
		category = "ALL MOBILE WEAPON NOTSUB ANTIFLAME ANTIEMG ANTILASER NOTLAND VTOL NOTSHIP NOTHOVER",
		collide = false,
		cruisealt = 110,
		description = "Fighter",
		explodeas = "smallExplosionGeneric",
		footprintx = 2,
		footprintz = 2,
		icontype = "air",
		maxdamage = 150,
		maxslope = 10,
		maxvelocity = 9.64,
		maxwaterdepth = 0,
		name = "Freedom Fighter",
		nochasecategory = "NOTAIR",
		objectname = "ARMFIG",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericSelfd",
		sightdistance = 210,
		turnrate = 850,
		blocking = false,
		customparams = {
			description_long = "The Freedom Fighter is a fast moving fighter jet that is designed for eliminating air units. It is the most effective form of T1 air defense that can access all parts of the map to get rid of any air threats. In large packs it is also able to destroy weak land based structures, like nano towers. Always put your fighters on patrol in front of your base, so they attack any aircraft moving in vicinity. Send fighters with your bombing runs to disable opponent's fighter wall before your bombers come to deliver the final blow.",
			wingsurface = 0.5,
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
				[1] = "vtolarmv",
			},
			select = {
				[1] = "vtolarac",
			},
		},
		weapondefs = {
			armvtol_missile = {
				areaofeffect = 48,
				avoidfeature = false,
				burnblow = true,
		    	canattackground = false,
				collidefriendly = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				cegTag = "missiletrailfighter",
				explosiongenerator = "custom:genericshellexplosion-tiny-air",
				firestarter = 0,
				impulseboost = 0,
				impulsefactor = 0,
				metalpershot = 0,
				model = "missile",
				name = "GuidedMissiles",
				noselfdamage = true,
				range = 680,
				reloadtime = 0.9,
				smoketrail = false,
				soundhit = "xplosml2",
				soundhitwet = "splshbig",
				soundhitwetvolume = 0.5,
				soundstart = "Rocklit3",
				startvelocity = 450,
				texture1 = "trans",
				texture2 = "armsmoketrail",
				tolerance = 12000,
				tracks = true,
				turnrate = 17000,
				weaponacceleration = 400,
				weapontype = "MissileLauncher",
				weaponvelocity = 850,
				damage = {
					bombers = 125,
					fighters = 200,
					vtol = 125,
					commanders = 4,
					default = 12,
					subs = 4,
				},
				customparams = {
					light_skip = true,		-- used by light_effects widget
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "NOTAIR",
				def = "ARMVTOL_MISSILE",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
