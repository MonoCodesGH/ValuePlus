--!strict
-- Services
const GroupService = game:GetService("GroupService");
const Players = game:GetService("Players");

-- Constants
const GROUP_ID = 0;

-- Class
const Player = {};

function Player.GetGroupRoles(player: Player): ({ string })
	assert(typeof(GROUP_ID) == "number" and GROUP_ID > 0, "Invalid group ID");
	
	if (player.UserId <= 0) then
		return {};
	end
	
	const roleData = GroupService:GetRolesInGroupAsync(player.User, GROUP_ID);
	if (not roleData or typeof(roleData.Roles) ~= "table") then
		return {};
	end
	
	const roles = {};
	for _, tbl in (roleData.Roles) do
		if (typeof(tbl) ~= "table") then
			continue;
		end
		
		for key, value in (tbl) do
			if (key == "Name") then
				table.insert(roles, value);
			end
		end
	end
	
	return roles;
end

function Player.GetGroupRank(player: Player): (number)
	assert(typeof(GROUP_ID) == "number" and GROUP_ID > 0, "Invalid group ID");
	
	if (player.UserId <= 0) then
		return 0;
	end
	
	const roleData = GroupService:GetRolesInGroupAsync(player.User, GROUP_ID);
	if (not roleData or typeof(roleData.Roles) ~= "table") then
		return 0;
	end
	
	local highestRank = 0;
	
	for _, tbl in (roleData.Roles) do
		if (typeof(tbl) ~= "table") then
			continue;
		end
		
		for key, value in (tbl) do
			if (key == "Rank") then
				highestRank = math.max(highestRank, value);
			end
		end
	end
	
	return highestRank;
end

return Player;
