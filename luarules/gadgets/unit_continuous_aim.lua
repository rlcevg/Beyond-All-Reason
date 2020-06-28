function gadget:GetInfo()
	return {
		name      = "Continuous Aim",
		desc      = "Applies lower 'reaimTime for continuous aim'",
		author    = "Doo",
		date      = "April 2018",
		license   = "Whatever works",
		layer     = 0,
		enabled   = true, -- When we will move on 105 :)
	}
end
if (not gadgetHandler:IsSyncedCode()) then return end

local convertedUnits = {
  -- value is reaimtime in frames, engine default is 15
	--[UnitDefNames.armart.id] = true,
	--[UnitDefNames.armfav.id] = true,
	--[UnitDefNames.armflash.id] = true,
	--[UnitDefNames.armjanus.id] = true,
	--[UnitDefNames.armpincer.id] = true,
	--[UnitDefNames.armsam.id] = true,
	--[UnitDefNames.armstump.id] = true,
	[UnitDefNames.armpw.id] = 1,
	[UnitDefNames.armflea.id] = 1,
	[UnitDefNames.armrock.id] = 1,
	[UnitDefNames.armham.id] = 1,
	[UnitDefNames.armwar.id] = 1,
	[UnitDefNames.armjeth.id] = 1,
	--[UnitDefNames.corfav.id] = true,
	--[UnitDefNames.corgarp.id] = true,
	--[UnitDefNames.corgator.id] = true,
	--[UnitDefNames.corlevlr.id] = true,
	--[UnitDefNames.cormist.id] = true,
	--[UnitDefNames.corraid.id] = true,
	--[UnitDefNames.corwolv.id] = true,
	[UnitDefNames.corak.id] = 1,
	[UnitDefNames.corthud.id] = 1,
	[UnitDefNames.corstorm.id] = 1,
	[UnitDefNames.corcrash.id] = 1,
	[UnitDefNames.armsnipe.id] = 1,
	[UnitDefNames.armfido.id] = 1,
	[UnitDefNames.armfboy.id] = 1,
	[UnitDefNames.armfast.id] = 1,
	[UnitDefNames.armamph.id] = 1,
	[UnitDefNames.armmav.id] = 1,
	[UnitDefNames.armspid.id] = 1,
	[UnitDefNames.armzeus.id] = 1,
	[UnitDefNames.coramph.id] = 1,
	[UnitDefNames.corcan.id] = 1,
	[UnitDefNames.corhrk.id] = 1,
	[UnitDefNames.cormando.id] = 1,
	[UnitDefNames.cormort.id] = 1,
	[UnitDefNames.corpyro.id] = 1,
	--[UnitDefNames.corsumo.id] = true,
	[UnitDefNames.cortermite.id] = 1,
	[UnitDefNames.armraz.id] = 1,
	[UnitDefNames.armmar.id] = 1,
	[UnitDefNames.armbanth.id] = 1,
	[UnitDefNames.corkrog.id] = 1,
	--[UnitDefNames.corkarg.id] = true,
	--[UnitDefNames.corjugg.id] = true,
	[UnitDefNames.armvang.id] = 1,
}

for udid, ud in pairs(UnitDefs) do
	for id, v in pairs(convertedUnits) do
		if string.find(ud.name, UnitDefs[id].name) then
			convertedUnits[udid] = v
		end
	end
end

local unitWeapons = {}
for unitDefID, unitDef in pairs(UnitDefs) do
	if unitDef.scriptName == "scripts/BASICTANKSCRIPT.LUA" then
		convertedUnits[unitDefID] = true
	end
	if #unitDef.weapons > 0 then
		for id, table in pairs(unitDef.weapons) do
			if not unitWeapons[unitDefID] then
				unitWeapons[unitDefID] = {}
			end
			unitWeapons[unitDefID][id] = table.weaponDef
		end
	end
end

local weaponRange = {}
for weaponDefID, def in pairs(WeaponDefs) do
	weaponRange[weaponDefID] = def.range
end

local popups = {	-- exclude auto target range boost for popup units
	[UnitDefNames.armclaw.id] = true,
	[UnitDefNames.armpb.id] = true,
	[UnitDefNames.armamb.id] = true,
	[UnitDefNames.cormaw.id] = true,
	[UnitDefNames.corvipe.id] = true,
	[UnitDefNames.corpun.id] = true,
	[UnitDefNames.corexp.id] = true,

	[UnitDefNames.corllt.id] = true,
	[UnitDefNames.armllt.id] = true,
}
if UnitDefNames['armcom_scav'] then
	local scavengerPopups = {}
	for k,v in pairs(popups) do
		scavengerPopups[k..'_scav'] = v
	end
	for k,v in pairs(scavengerPopups) do
		popups[k] = v
	end
	scavengerPopups = nil
end

function gadget:UnitCreated(unitID,unitDefID)
	if convertedUnits[unitDefID] and unitWeapons[unitDefID] then
		for id, _ in pairs(unitWeapons[unitDefID]) do
      -- NOTE: this will prevent unit from firing if it does not IMMEDIATELY return from AimWeapon (no sleeps, not wait for turns!)
      -- So you have to manually check in script if it is at the desired heading
      -- https://springrts.com/phpbb/viewtopic.php?t=36654
			Spring.SetUnitWeaponState(unitID, id, "reaimTime", convertedUnits[unitDefID])
		end
	end
	if not popups[unitDefID] and unitWeapons[unitDefID] then
		for id, wdefID in pairs(unitWeapons[unitDefID]) do
			Spring.SetUnitWeaponState(unitID, id, "autoTargetRangeBoost", (0.1*weaponRange[wdefID]) or 20)
		end
	end
end