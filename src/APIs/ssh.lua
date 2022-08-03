ssh = {}
ssh.server = {}
ssh.client = {}
 
-- Functions --
function ssh.server:Connect(channel)
    if peripheral.find("modem") == nil then error("This device must have a modem.") end
    peripheral.find("modem", rednet.open)
    while true do 
        sleep(0.4)
        data, message = rednet.receive(channel, 50)
        if not message == nil then
            result = shell.run(message)
            rednet.send(data, result)
            print("Executing: ".. message)
        end
    end
end

function ssh.client:Connect(channel)
    if peripheral.find("modem") == nil then error("This device must have a modem.") end
    peripheral.find("modem", rednet.open)
    if rednet.send(DeviceId, "ping") == false then error("Error Code: 567") end
    
    local client = {}
    client.target = channel
    function client.post(shellline)
        if rednet.isOpen() == false then peripheral.find("modem", rednet.open) end
        rednet.broadcast(shellline, self.target)
        data, response = rednet.receive(self.target, 30)
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