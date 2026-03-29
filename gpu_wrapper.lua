-- GPU Wrapper for graphics abstraction layer
local gpu_wrapper = {}

-- Set the text on the GPU
function gpu_wrapper.setText(text)
    gpu.setForeground(0xFFFFFF) -- Set color to white
    gpu.set(text)
end

-- Fill a rectangle with a color
function gpu_wrapper.fillRect(x, y, width, height, color)
    gpu.setBackground(color)
    for i = 1, height do
        gpu.fill(x, y + i - 1, width, 1, " ")
    end
end

-- Draw a border around a defined area
function gpu_wrapper.drawBorder(x, y, width, height, color)
    gpu.setBackground(color)
    gpu.fill(x, y, width, 1, " ") -- Top border
    gpu.fill(x, y + height - 1, width, 1, " ") -- Bottom border
    gpu.fill(x, y, 1, height, " ") -- Left border
    gpu.fill(x + width - 1, y, 1, height, " ") -- Right border
end

-- Clear the screen
function gpu_wrapper.clear()
    gpu.fill(1, 1, gpu.getResolution(), gpu.getResolution(), " ")
end

-- Set the resolution
function gpu_wrapper.setResolution(width, height)
    gpu.setResolution(width, height)
end

return gpu_wrapper
