# Table of Contents
[Tricorder APIs](https://github.com/Oktan-Burg/CC-Tricorder-OS/blob/main/src/readme.md/#tricorder-apis)

## Contributers
MC: Narwin_Tasori | <br>
Discord: kyoto#1563 | <br> 
Github: Oktan-Burg | <br>


## Tricorder APIs 
### Secure Shell API <br>
> #### Features <br>
> ##### 1. Server Methods <br>
> Description: Allow users to connect to your relay with the server. <br>
> 1. `ssh.server:Connect(channel)`
```lua
require("ssh")
ssh.server:Connect("mychannelprotocol")
```
> ##### 2. Client Methods <br>
> Description: Connects your device to a relay and allows <br>
> 1. `Client = server.client:Connect(channel)`
```lua
require("ssh")
Client = ssh.server:Connect("mychannelprotocol")
-- Client Object --
Client.post("ls /rom") -- Sends a shell line to all relays on the channel.
```
