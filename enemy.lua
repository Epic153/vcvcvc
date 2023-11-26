local DataStoreService = game:GetService("DataStoreService")
local bannedPlayersDataStore = DataStoreService:GetDataStore("BannedPlayers")

local players = game.Players:GetPlayers()
for _, player in ipairs(players) do
    local success, isBanned = pcall(function()
        return bannedPlayersDataStore:GetAsync(tostring(player.UserId))
    end)

    if success and isBanned then
        player:Destroy()
    end
end
