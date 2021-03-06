ArtilleryHandler = class(Module)

function ArtilleryHandler:Name()
	return "ArtilleryHandler"
end

function ArtilleryHandler:internalName()
	return "artilleryhandler"
end

function ArtilleryHandler:Init()
	self.targetPool = {}
	self.ratio = math.random(1,10)
	self.squads = {}
	self.squadmaxsize = 20 -- Smaller size = more cpu usage !
end

function ArtilleryHandler:Update()

	--Commander position for atk behaviour
	local frame = Spring.GetGameFrame()
	
	-- commpos stuff was here
	
	--TargetPoolThread
	if frame%300 == 225+(self.ai.id*7) then
		self:TargetPoolThread()	
	end
	if self.myUnitCount == nil or artyAttackRefreshRate == nil or artyRegroupRefreshRate == nil or (frame+self.myUnitCount)%2000 == 0 then
		self.myUnitCount = Spring.GetTeamUnitCount(self.ai.id)
		artyAttackRefreshRate = self.myUnitCount*5
		if artyAttackRefreshRate < 120 then
			artyAttackRefreshRate = 120
		end
		artyRegroupRefreshRate = artyAttackRefreshRate*3
	end
	--Assign Targets To Squads
	for i, squad in pairs(self.squads) do
		if (frame%artyRegroupRefreshRate == (i*1500+(self.ai.id*4000))%artyRegroupRefreshRate) and not self.CommInDanger then
			self.squads[i].position = self:GetSquadPosition(i)
			if squad.position and squad.position.x then -- squad.target and squad.target.x -- Queue commands midway so it tries to group up the units first
				local movetargetpos = squad.position
				Spring.GiveOrderToUnitMap(squad.units, CMD.MOVE, {movetargetpos.x, movetargetpos.y, movetargetpos.z},{""})
			end
		elseif (frame%artyAttackRefreshRate == (i*1500+(self.ai.id*4000))%artyAttackRefreshRate) then -- Generate squad targets
			--update position
			self.squads[i].position = self:GetSquadPosition(i)
			if self.targetPool[1] then
				self.squads[i].target = self.targetPool[1]
			elseif self.targetPool[2] then
				self.squads[i].target = self.targetPool[2]
			elseif self.targetPool[3] then
				self.squads[i].target = self.targetPool[3]
			else
				local target = GG.AiHelpers.TargetsOfInterest.GetTarget(self.ai.id)
				if ai.triggerhandler.CommInDanger and ai.triggerhandler.CommAttackerPos and ai.triggerhandler.CommAttackerPos.x then
					self.squads[i].target = ai.triggerhandler.CommAttackerPos
				elseif target and squad.role == "attacker" then
					self.squads[i].target = target
				else
					if squad.role == "attacker" then
						self.squads[i].target = self.ai.metalspothandler:ClosestEnemySpot(self.game:GetTypeByName("armmex") , self.squads[i].position )
						self:SetSquadAggressiveness(i, 2)
					else
						if Spring.GetGameSeconds() < ai.aimodehandler.nodefenderscounter then
							if self.ai.metalspothandler:ClosestFreeSpot(self.game:GetTypeByName("armmex") , self.squads[i].position) then
								self.squads[i].target = self.ai.metalspothandler:ClosestFreeSpot(self.game:GetTypeByName("armmex") , self.squads[i].position)
								self:SetSquadAggressiveness(i, 2)
							else
								self.squads[i].target = self.ai.metalspothandler:ClosestEnemySpot(self.game:GetTypeByName("armmex") , self.squads[i].position )
								self:SetSquadAggressiveness(i, 2)
							end
						else
							self.squads[i].target = self.ai.metalspothandler:ClosestEnemySpot(self.game:GetTypeByName("armmex") , self.squads[i].position )
							self:SetSquadAggressiveness(i, 2)
						end
					end
				end
			end
			if squad.target and squad.target.x and squad.role then -- Queue commands midway so it tries to group up the units first
				local movetargetpos = squad.target
				Spring.GiveOrderToUnitMap(squad.units, CMD.MOVE, {movetargetpos.x, movetargetpos.y, movetargetpos.z},{"ctrl"})
			end
		end
	end
end

function ArtilleryHandler:GetMovePosition(target, position)
	local movex = target.x - position.x
	local movez = target.z - position.z
	local distancesqr = (movex*movex) + (movez*movez)
	local distance = math.sqrt(distancesqr)
	local limitedDistance = math.min(distance, 500)
	local factor = limitedDistance / distance
	local goalx, goalz = position.x + movex*factor, position.z + movez*factor
	local goaly = Spring.GetGroundHeight(goalx, goalz)
	return {goalx, goaly,goalz}
end

function ArtilleryHandler:TargetPoolThread() -- targetPool[1]= top priority targetpos, [2] = secondary, [3] = tertiary
	-- Commander Protection
	local comms = Spring.GetTeamUnitsByDefs(self.ai.id, {UnitDefNames.armcom.id, UnitDefNames.corcom.id})
	if comms[1] then
		local nearestEnemy = Spring.GetUnitNearestEnemy(comms[1], 2500)
		local visionCheck = nearestEnemy and GG.AiHelpers.VisibilityCheck.IsUnitVisible(nearestEnemy, self.ai.id)
		local isNotAir = nearestEnemy and (UnitDefs[Spring.GetUnitDefID(nearestEnemy)].canFly == false)
		if nearestEnemy and visionCheck and isNotAir then
			local pos = {}
			pos.x, pos.y, pos.z = Spring.GetUnitPosition(nearestEnemy)
			self.targetPool[1] = pos
		else
			self.targetPool[1] = nil
		end
	end
end

function ArtilleryHandler:SetSquadAggressiveness(i, value)
	for unitID, atkbehaviour in pairs (self.squads[i].units) do
		atkbehaviour.AggFactor = value
	end
end

function ArtilleryHandler:GetAggressiveness(atkbehaviour)
	return (2)
end

function ArtilleryHandler:GetSquadRole(atkbehaviour)
	if self.ratio == 1 or math.random(1, self.ratio) == 1 then
		return ("attacker")
	else
		return ("defender")
	end
end

function ArtilleryHandler:PickRandomPositionsOnMap()
	local pos = {{math.random(0,Game.mapSizeX), math.random(0,Game.mapSizeZ)},{math.random(0,Game.mapSizeX), math.random(0,Game.mapSizeZ)},{math.random(0,Game.mapSizeX), math.random(0,Game.mapSizeZ)},{math.random(0,Game.mapSizeX), math.random(0,Game.mapSizeZ)},{math.random(0,Game.mapSizeX), math.random(0,Game.mapSizeZ)}}
	return pos
end

function ArtilleryHandler:GetSquadPosition(i)
	local pos = {x = 0, y = 0, z = 0}
	for unitID, atkbehaviour in pairs(self.squads[i].units) do
		local thisUnitPos = atkbehaviour.unit:Internal():GetPosition()
		pos.x = pos.x + thisUnitPos.x
		pos.z = pos.z + thisUnitPos.z
		--break
	end
	pos.x = pos.x/self.squads[i].size
	pos.z = pos.z/self.squads[i].size
	pos.y = Spring.GetGroundHeight(pos.x, pos.z)
	return pos
end

-- Squads management

function ArtilleryHandler:CreateSquad(i)
	self.squads[i] = {size = 0, target = {}, units = {}, role = self:GetSquadRole(), position = {x = 0, y = 0, z = 0}}
	--Spring.Echo("Squad "..i.." created")
end

function ArtilleryHandler:RemoveSquad(i)
	self.squads[i] = nil
	--Spring.Echo("Squad "..i.." removed")
end

function ArtilleryHandler:AssignToASquad(atkbehaviour)
	local done = false
	for i, squad in pairs(self.squads) do
		if self.squads[i].size < self.squadmaxsize then
			self.squads[i].units[atkbehaviour.unit:Internal().id] = atkbehaviour
			self.squads[i].size = self.squads[i].size + 1
			--Spring.Echo(atkbehaviour.unit:Internal().id.." assigned to squad "..i)
			done = true
			break
		end
	end
	if not done then
		local i = 1
		while self.squads[i] do
			i = i + 1
		end
		self:CreateSquad(i)
		self.squads[i].units[atkbehaviour.unit:Internal().id] = atkbehaviour
		self.squads[i].size = self.squads[i].size + 1
		--Spring.Echo(atkbehaviour.unit:Internal().id.." assigned to new squad "..i)
	end
	atkbehaviour.behaviourcontroled = false
end

function ArtilleryHandler:RemoveFromSquad(atkbehaviour)
	for i, squad in pairs(self.squads) do
		if self.squads[i].units[atkbehaviour.unit:Internal().id] then
			self.squads[i].units[atkbehaviour.unit:Internal().id] = nil
			self.squads[i].size = self.squads[i].size - 1
			if self.squads[i].size == 0 then
				self:RemoveSquad(i)
			end
			--Spring.Echo(atkbehaviour.unit:Internal().id.." removed from squad "..i)
			break
		end
	end
	atkbehaviour.behaviourcontroled = true
end
--

function ArtilleryHandler:ScoreUnit(unit)
	local value = 1
	--[[
	if unit:CanMove() then
		if unit:CanBuild() then
			value = value + 1
		end
	else
		value = value + 2
		if unit:CanBuild() then
			value = value + 2
		end
	end
	--]]
	return value
end
