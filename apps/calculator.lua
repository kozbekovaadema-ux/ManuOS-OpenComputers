-- Calculator application for OpenComputers

local component = require("component")
local gpu = component.gpu
local term = require("term")

gpu.setResolution(50, 20)
term.clear()

function add(a, b)
    return a + b
end

function subtract(a, b)
    return a - b
end

function multiply(a, b)
    return a * b
end

function divide(a, b)
    if b == 0 then
        return "Error: Division by zero"
    end
    return a / b
end

term.write("Simple Calculator\n")
term.write("-------------------\n")

while true do
    term.write("Enter first number: ")
    local firstNum = tonumber(io.read())
    term.write("Enter operation (+, -, *, /): ")
    local operation = io.read()
    term.write("Enter second number: ")
    local secondNum = tonumber(io.read())

    local result
    if operation == "+" then
        result = add(firstNum, secondNum)
    elseif operation == "-" then
        result = subtract(firstNum, secondNum)
    elseif operation == "*" then
        result = multiply(firstNum, secondNum)
    elseif operation == "/" then
        result = divide(firstNum, secondNum)
    else
        result = "Error: Invalid operation"
    end

    term.write(string.format("Result: %s\n", tostring(result)))
    term.write("Press enter to continue or type 'exit' to quit: ")
    local userInput = io.read()
    if userInput == "exit" then
        break
    end
end

term.write("Calculator program exited.\n").