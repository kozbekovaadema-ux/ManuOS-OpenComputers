-- calculator.lua

-- A simple Lua calculator application that evaluates expressions

-- Function to evaluate a Lua expression
local function evaluate_expression(expression)
    local f, err = load("return " .. expression)
    if not f then
        return nil, err
    end
    return f()
end

-- Main program loop
while true do
    io.write("Enter a Lua expression (or type 'exit' to quit): ")
    local input = io.read()
    if input:lower() == 'exit' then
        break
    end
    local result, err = evaluate_expression(input)
    if err then
        print("Error: " .. err)
    else
        print("Result: " .. tostring(result))
    end
end
