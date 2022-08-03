ssh = {}
ssh.server = {}
ssh.client = {}

-- Functions --
function ssh.server:Connect(passKeyLevel, allowedID)
    if peripheral.find("modem") == nil then error("This device must have a modem.") end
    peripheral.find("modem", rednet.open())
    while true do 
        sleep(0.4)
        data, message = rednet.receive(50)
        if not message == nil and data == allowedID and passKeyLevel > 0 then
            result = shell.run(message)
            rednet.send(data, result)
        elseif not message == nil and passKeyLevel == 0 then
            result = shell.run(message)
            rednet.send(data, result)
        end
    end
end

function ssh.client:Connect(DeviceId)
    if peripheral.find("modem") == nil then error("This device must have a modem.") end
    peripheral.find("modem", rednet.open())
    if rednet.send(DeviceId, "ping") == false then error("Error Code: 567") end
    
    local client = {}
    function client.post(shellline)
        if rednet.isOpen() == false then peripheral.find("modem", rednet.open()) end
        rednet.send(DeviceId, shellline)
        data, response = rednet.receive(30)
        if data == DeviceId then
            if response == nil then
                return nil
            else
                return response
            end
        end
    end
    return client
end 
-- Break --