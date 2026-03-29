-- UI Framework for ManuOS

local UIFramework = {}

function UIFramework.newWidget(widgetType)
    local widget = {}  -- create a new table for the widget
    widget.type = widgetType
    return widget
end

function UIFramework.createButton(label, onClick)
    local button = UIFramework.newWidget("button")
    button.label = label
    button.onClick = onClick
    return button
end

function UIFramework.createLabel(text)
    local label = UIFramework.newWidget("label")
    label.text = text
    return label
end

return UIFramework