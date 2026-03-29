-- Event Manager Module
-- This module handles events for the ManuOS system

local EventManager = {}

-- Table to hold registered event listeners
EventManager.listeners = {}

-- Function to register a listener for a specific event
function EventManager:on(event, listener)
    if not self.listeners[event] then
        self.listeners[event] = {}
    end
    table.insert(self.listeners[event], listener)
end

-- Function to emit an event and trigger its listeners
function EventManager:emit(event, ...)
    if self.listeners[event] then
        for _, listener in ipairs(self.listeners[event]) do
            listener(...)
        end
    end
end

-- Function to unregister a listener for a specific event
function EventManager:off(event, listener)
    if self.listeners[event] then
        for i, l in ipairs(self.listeners[event]) do
            if l == listener then
                table.remove(self.listeners[event], i)
                break
            end
        end
    end
end

return EventManager
