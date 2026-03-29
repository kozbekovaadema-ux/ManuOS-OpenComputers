-- File Manager Application

local file_manager = {}

function file_manager.list_files(directory)
    local files = {}  -- A table to hold the names of files
    local handle = fs.open(directory, "r")  -- Open the directory in read mode

    if not handle then
        print("Error: Could not open directory.")
        return nil
    end

    while true do
        local file = handle.readLine()  -- Read each file name in the directory
        if not file then break end  -- Exit the loop if there are no more files
        table.insert(files, file)  -- Add the file name to the table
    end

    handle.close()  -- Make sure to close the handle
    return files
end

function file_manager.delete_file(file_path)
    if fs.exists(file_path) then
        fs.delete(file_path)
        print("File deleted: " .. file_path)
    else
        print("Error: File does not exist.")
    end
end

function file_manager.create_file(file_path, content)
    local file = fs.open(file_path, "w")  -- Open the file in write mode
    file.write(content)  -- Write content to the file
    file.close()  -- Close the file handle
    print("File created: " .. file_path)
end

return file_manager  -- Return the file_manager module
