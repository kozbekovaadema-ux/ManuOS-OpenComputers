-- Terminal Application for OpenComputers

local component = require("component")
local event = require("event")
local shell = require("shell")

local function main()
    print("Welcome to the Terminal Application!")

    while true do
        -- Get user input
        io.write("> ")
        local input = io.read()

        if input == "exit" then
            print("Exiting Terminal...")
            break
        end

        -- Execute the command
        local result, err = shell.execute(input)

        if result then
            print(result)
        else
            print("Error: " .. err)
        end
    end
end

main()