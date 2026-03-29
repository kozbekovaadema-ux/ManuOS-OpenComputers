-- Text Editor Application for OpenComputers

local component = require("component")
local computer = require("computer")
local event = require("event")
local shell = require("shell")
local term = require("term")

local textEdit = {}

-- Main Text Editor Function
function textEdit.run()
    term.clear()
    term.setCursor(1, 1)
    print("Text Editor - Type your text below (Press Ctrl+S to save, Ctrl+Q to quit)")

    local content = ""
    local running = true

    while running do
        local eventData = {event.pull()}
        if eventData[1] == "key_down" then
            local key = eventData[4]
            local char = string.char(key)
            if key == 16 then -- Ctrl+S
                textEdit.save(content)
            elseif key == 16 then -- Ctrl+Q
                running = false
            else
                content = content .. char
                term.write(char)
            end
        end
    end
end

-- Function to Save Content to a File
function textEdit.save(content)
    term.clear()
    term.setCursor(1, 1)
    print("Enter filename to save:")
    local filename = io.read()
    local file = io.open(filename, "w")
    if file then
        file:write(content)
        file:close()
        print("File saved as " .. filename)
    else
        print("Error saving file!")
    end
end

return textEdit
