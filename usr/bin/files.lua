-- File manager application for browsing directories

local filesystem = require('filesystem')
local shell = require('shell')

local function listDirectory(path)
    local items = filesystem.list(path)
    for item in items do
        print(item)
    end
end

local function main()
    local currentDir = shell.getWorkingDirectory()
    print('Browsing directory: ' .. currentDir)
    listDirectory(currentDir)
end

main()