local shell = {}

-- Print Working Directory
function shell.pwd()
    return os.getenv("PWD")
end

-- Change Directory
function shell.cd(dir)
    if os.execute("cd " .. dir) then
        return true
    else
        return false, "Directory not found"
    end
end

-- List Directory
function shell.ls()
    local files = {}
    for file in io.popen("ls -1"):lines() do
        table.insert(files, file)
    end
    return files
end

-- Concatenate Files
function shell.cat(filename)
    local file = io.open(filename, "r")
    if not file then return false, "File not found" end
    local content = file:read("*a")
    file:close()
    return content
end

-- Make Directory
function shell.mkdir(dir)
    return os.execute("mkdir " .. dir)
end

-- Remove File/Directory
function shell.rm(path)
    return os.execute("rm -rf " .. path)
end

-- Create File
function shell.touch(filename)
    local file = io.open(filename, "a")
    if file then file:close() end
    return true
end

-- Clear Screen
function shell.clear()
    os.execute("clear")
end

-- Help
function shell.help()
    return "Available commands: pwd, cd, ls, cat, mkdir, rm, touch, clear, help, time, mem, exit"
end

-- Current Time
function shell.time()
    return os.date("%Y-%m-%d %H:%M:%S")
end

-- Memory Usage
function shell.mem()
    local mem = collectgarbage("count")
    return "Memory usage: " .. mem .. "KB"
end

-- Exit Shell
function shell.exit()
    os.exit()
end

-- Execute Command
function shell.execute(command)
    return os.execute(command)
end

return shell
