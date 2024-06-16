Config = {}
Config.UseTestCommand = false -- true = Test command enabled - false = Test command not enabled
Config.TestCommand = 'testcommand' -- Test command name
Config.Target = false -- true = use Target - false = use drawtext
Config.UseQbTarget = true -- true = if you are using a QB destination - false = if you are using an ox destination
Config.TargetLabel = 'Barterer' -- Text to appear on the target
Config.DrawTextLabel = 'E - Barterer' -- Text to type if you are using drawtext
Config.DrawTextKey = 38 -- 38 = E - If you are using drawtext, enter which key you want to open it with https://docs.fivem.net/docs/game-references/controls/

Config.Ped = {
    {npcHash = 's_m_m_ammucountry' ,coords = vector3(2165.99, 2263.26, 106.58), npcHeading = 188.91} -- Position to place the pad
}

Config.MenuLabel = 'Treade Menu' -- Text in the drop-down menu
Config.TreadeItem = {
    {
        title = 'Armor', -- Menu title
        description = 'Give 2 pieces of light armor and take 1 piece of heavy armor.', -- Menu description
        icon = 'shield-halved', -- Menu icon
        removeitem = 'heavyarmor', -- Name of the items to be taken from the person
        removeitemAmount = 2, -- Number of items to receive
        additem = 'armor', -- Item name to be given
        additemAmount = 1 -- Number of items to be given
    },
}

Notify = {
    ['trade_successful'] = 'Exchange successful',
    ['trade_error'] = 'You dont have enough stuff on you.',
    ['hasitem_error'] = 'No necessary items on it',
    ['test_command'] = 'Test command off',
}

-- If you are using drawtext, you can set the font here
function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.28, 0.28)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 245)
    SetTextOutline(true)
    SetTextEntry('STRING')
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
end