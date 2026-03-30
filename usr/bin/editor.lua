-- editer.lua

local editor = {}

-- Function to create a new file with the given name
function editor.createFile(name)
    local file = io.open(name, "w")
    if not file then
        print("Could not create file: " .. name)
        return
    end
    file:close()
    print("File created: " .. name)
end

-- Function to edit an existing file
function editor.editFile(name)
    local file = io.open(name, "r+")
    if not file then
        print("Could not open file: " .. name)
        return
    end

    print("Editing file: " .. name)
    print("Current content:")
    print(file:read("*all"))

    print("Enter new content (type 'exit' on a new line to save):")
    local newContent = ""
    while true do
        local line = io.read()
        if line == "exit" then break end
        newContent = newContent .. line .. "\n"
    end

    file:seek("set", 0)
    file:write(newContent)
    file:close()
    print("File updated: " .. name)
end

return editor
