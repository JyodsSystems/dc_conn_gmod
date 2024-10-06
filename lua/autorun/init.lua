
JS = {}
JS.Config = {}

local function AddFile(File, dir)
    local fileSide = string.lower(string.Left(File, 3))
    if SERVER and fileSide == "sv_" then
        include(dir..File)
        print("[JS] SV INCLUDE: " .. File)
    elseif fileSide == "sh_" then
        if SERVER then 
            AddCSLuaFile(dir..File)
            print("[JS] SH ADDCS: " .. File)
        end
        include(dir..File)
        print("[JS] SH INCLUDE: " .. File)
    elseif fileSide == "cl_" then
        if SERVER then 
            AddCSLuaFile(dir..File)
            print("[JS] CL ADDCS: " .. File)
        else
            include(dir..File)
            print("[JS] CL INCLUDE: " .. File)
        end
    end
end

local function IncludeDir(dir)
    dir = dir .. "/"
    local File, Directory = file.Find(dir.."*", "LUA")

    for k, v in ipairs(File) do
        if string.EndsWith(v, ".lua") then
            AddFile(v, dir)
        end
    end
    
    for k, v in ipairs(Directory) do
        print("[JS] Directory: " .. v)
        IncludeDir(dir..v)
    end
end

hook.Add("js.registerModule", "js.registerModule", function(module)
    if module.Name then
        print("[JS] Registered module: " .. module.Name)
    end
end)

IncludeDir("modules")