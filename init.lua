-- init.lua

-- Bootloader for ManuOS on OpenComputers

local coreModules = {
    "moduleA",
    "moduleB",
    "moduleC"
}

--- Function to load modules
local function loadModules()
    for _, module in ipairs(coreModules) do
        local success, err = pcall(require, module)
        if not success then
            print("Error loading module: " .. module .. " - " .. err)
            os.exit(1)
        end
    end
end

--- Function to start the main event loop
local function mainEventLoop()
    while true do
        -- Main event processing logic goes here
        os.sleep(1)  -- Dummy sleep to prevent busy waiting
    end
end

-- Initialize core modules
loadModules()

-- Start the main event loop
mainEventLoop()