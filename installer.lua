--Scripted by Kyoto_Tasori - PDA/Tricorder

-- Check if the device has an playerDetector
pde = peripheral.find("playerDetector") 
if pde == nil then error("This device does not have an playerDetector") end
-- Check if the device is a Pocket Computer
if not pocket then error("This device must be a pocket computer.") end


-- functions --
function readyFolders()
    if fs.exists("/startup") then shell.run("rm /startup") end
    if fs.exists("/startup.lua") then shell.run("rm /startup.lua") end    
    shell.run("mkdir persLogs")
    shell.run("mkdir ASSETS")
end

function writeFiles()
    term.setTextColor( colors.blue )
    term.setCursorPos(23,13)
    print("Getting Ready...")
    term.setCursorPos(2,2)
    sleep(4)
    term.clear()
    --------------------------------------------
    term.setCursorPos(1,1)
    print("What is your username? This can be changed and is needed.")
    print(": ")
    term.setCursorPos(3,4)
    os.setComputerLabel(read())
    ---------------------------------------------
    local startupFileContent = [[

pde = peripheral.wrap("back")
function commandprocess(key) --
    if key == 81 then
        -- shell button
        shell.run("fg shell")
    end
end
--------------------
while true do
    os.pullEvent = os.pullEventRaw
    -- Print Position Start
    sleep(0.2)
    term.clear()
    username = os.getComputerLabel()
    local posInfo = pde.getPlayerPos(username)
    pos = tostring(posInfo.x)..", "..tostring(posInfo.y)..", "..tostring(posInfo.z)
    term.setCursorPos(2,1)
    print("Position: "..pos)
    -- Print Position End
    
    -- 
    event, key = os.pullEvent()
    if key and event == "key" then commandprocess(key) end
    
end

    ]]
    startupFile = io.open("/startup", 'w')
    startupFile:write(startupFileContent)
    startupFile:close()
    shell.run("reboot")
end

readyFolders()
writeFiles()

    