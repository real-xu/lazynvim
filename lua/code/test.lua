-- file to test vscode extension post load
local vscode = require('vscode')

-- defined callback to test basic functionality
do -- Execute _ping asynchronously and print the result
  vscode.action("_ping", {
    callback = function(err, res)
      if err == nil then
        print(res) -- outputs: pong
      end
    end,
  })
end

-- call callback 
print(vscode.call("_ping")) -- outputs: pong