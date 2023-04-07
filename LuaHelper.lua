                                                                                                   
--  ________      ___    ___      _____ ______   ________  ________  ________      ___    ___        ________  ________  ________  ___   ___     
--  |\   __  \    |\  \  /  /|    |\   _ \  _   \|\   __  \|\   ___ \|\_____  \    |\  \  |\  \      |\_____  \|\_____  \|\_____  \|\  \ |\  \    
--  \ \  \|\ /_   \ \  \/  / /    \ \  \\\__\ \  \ \  \|\  \ \  \_|\ \|____|\  \ __\_\  \_\_\  \_____ \|___/  /\|____|\ /_\|___/  /\ \  \\_\  \   
--   \ \   __  \   \ \    / /      \ \  \\|__| \  \ \   __  \ \  \ \\ \    \ \__|\____    ___    ____\    /  / /     \|\  \   /  / /\ \______  \  
--    \ \  \|\  \   \/  /  /        \ \  \    \ \  \ \  \ \  \ \  \_\\ \    \|__\|___| \  \__|\  \___|   /  / /     __\_\  \ /  / /  \|_____|\  \ 
--     \ \_______\__/  / /           \ \__\    \ \__\ \__\ \__\ \_______\       ___ __\_\  \_\_\  \_____/__/ /     |\_______/__/ /          \ \__\
--      \|_______|\___/ /             \|__|     \|__|\|__|\|__|\|_______|      |\__|\____    ____   ____|__|/      \|_______|__|/            \|__|
--               \|___|/                                                       \|__\|___| \  \__|\  \___|                                         
--                                                                                       \ \__\ \ \__\                                            
--                                                                                        \|__|  \|__|                                            

-- Vector calculations
function DistTo3D(a, b)
    return (quick_maths.create_vector3d(a.x - b.x, a.y - b.y, a.z - b.z)):get_length()
end

function Vector3D_Z_Diff(a, b)
    return (b.z - a.z)
end

function AddVectors3D(a, b)
    return quick_maths.create_vector3d(a.x + b.x, a.y + b.y, a.z + b.z)
end

function MultiplyVector3D(a, b)
    return quick_maths.create_vector3d(a.x * b.x, a.y * b.y, a.z * b.z)
end

function AddToVector3D(a, b)
    return quick_maths.create_vector3d(a.x + b, a.y + b, a.z + b)
end

function MultiplyVector3D(a, b)
    return quick_maths.create_vector3d(a.x * b, a.y * b, a.z * b)
end

function SubstractVector3D(a,b)
    return quick_maths.create_vector3d(a.x - b.x, a.y - b.y, a.z - b.z)
end

function TickExtrapolateVector3D(vec, amount)
    return MultiplyVector3D(general.ticks_to_time(amount))
end

-- General Helpers
function IsVisible(start, _end, ignore_ent, entity)
    local res = engine_game_trace.get_line(start.x, start.y, start.z, _end.x, _end.y, _end.z, trace_mask.mask_shot, ignore_ent)
    return res.get_fraction > 0.99 or res.get_entity == entity
end

function IsConvarTrue(var)
    local v = general.get_convar(var)
    return v:get_int() == 1
end

function log(str)
    general.log(str)
end

function ArrLen(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

-- Player Helpers
function IsAutoSniper(local_wep)
    return (local_wep:get_class_id() == 261 or local_wep:get_class_id() == 242)
end

function GetEyePos(Player)
    return AddVectorsZ(Player:get_abs_origin(), Player:get_netvar_c_vector3d("m_vecViewOffset[0]"))
end

-- Visual Helpers
function IsOnScreen(box)
    return box.x > renderer.get_screen_width() or box.x + box.w < 0 or box.y > renderer.get_screen_height() or box.y + box.h > 0
end

-- Menu Additions
function AddSeperator(str)
    menu.add_text("")
    menu.add_text(str)
    menu.add_separator("")
end
