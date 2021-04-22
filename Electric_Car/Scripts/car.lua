-- Script generated by Lokasenna's GUI Builder

local lib_path = reaper.GetExtState("Lokasenna_GUI", "lib_path_v2")
if not lib_path or lib_path == "" then
    reaper.MB("Couldn't load the Lokasenna_GUI library. Please run 'Set Lokasenna_GUI v2 library path.lua' in the Lokasenna_GUI folder.", "Whoops!", 0)
    return
end
loadfile(lib_path .. "Core.lua")()


GUI.req("Classes/Class - Label.lua")()
GUI.req("Classes/Class - Button.lua")()
GUI.req("Classes/Class - Textbox.lua")()
GUI.req("Classes/Class - Slider.lua")()
-- If any of the requested libraries weren't found, abort the script.
if missing_lib then return 0 end

GUI.name = "Electric Car"
GUI.x, GUI.y, GUI.w, GUI.h = 0, 0, 605, 275
GUI.anchor, GUI.corner = "mouse", "C"

velocity = 0
minVelocity = 0
maxVelocity = 60
isAccelerating = false
isBraking = false
sel_env = nil

-- Variables related to the Tone Gate frequency
min_frequency = 83
max_frequency = 280

function updateVelocity(newVelocity)
    velocity = newVelocity
    if velocity > maxVelocity then
        velocity = maxVelocity
    elseif velocity < minVelocity then
        velocity = minVelocity
    end
    GUI.Val(velocity_slider, {velocity})

    if sel_env ~= nil then        
        --reaper.ShowConsoleMsg("Please select an envelope!\n")

        --[[
            TODO
                Change the frequency according to the min_frequency, max_frequency, and velocity
        ]]--
    end
end

function accelerate() 
    isAccelerating = true
end

function stopAccelerate()
    isAccelerating = false
end

function brake()
    isBraking = true
end

function stopBrake()
    isBraking = false
end

function sliderChange(step)
    updateVelocity(tonumber(step))
    return step
end

--[[ Gets the selected envelope.]]--
function get_envelope()
    -- get the selected envelope. sel_env is a global variable that can be seen by every function!
    sel_env = reaper.GetSelectedEnvelope( 0 )
    -- if there is no selected envelope, then we complain to the use
    if not sel_env then
        reaper.ShowMessageBox("Please select an envelope!", "Error", 0)
    else
        -- get the name of the selected envelope
        local _, env_name = reaper.GetEnvelopeName(sel_env, "")
        -- get the track that the envelope is attached to
        local parent_track, _, _ = reaper.Envelope_GetParentTrack(sel_env)
        -- get the name of the track
        local _, track_name = reaper.GetSetMediaTrackInfo_String(parent_track, "P_NAME", "", false)
        GUI.Val("cur_env_txt", track_name .. " - " .. env_name)
    end
end

function updateFrequencies()
    local freq = GUI.Val(frequency_slider)

    if freq == nil then
        reaper.ShowConsoleMsg("Slider nil value\n") 
        return
    end

    min_frequency = freq[1]
    max_frequency = freq[2]
end

function main()      
    updateFrequencies()

    if isAccelerating then
        updateVelocity(velocity + 2)
    else
        if isBraking then
          velocity = velocity - 2
        end
        updateVelocity(velocity - 1)
    end
end

velocity_slider = GUI.New("Velocity", "Slider", {
    z = 11,
    x = 250,
    y = 30,
    w = 96,
    caption = "Velocity",
    min = minVelocity,
    max = maxVelocity,
    defaults = {0},
    inc = 1,
    dir = "h",
    font_a = 3,
    font_b = 4,
    col_txt = "txt",
    col_fill = "elm_fill",
    bg = "wnd_bg",
    show_handles = false,
    show_values = true,
    cap_x = 0,
    cap_y = 0,
    output = sliderChange
})

GUI.New("Accelerator", "Button", {
    z = 11,
    x = 310,
    y = 65,
    w = 60,
    h = 125,
    caption = "Accelerate",
    font = 3,
    col_txt = "txt",
    col_fill = "elm_frame",
    mouseup_handler = stopAccelerate,
    mousedown_handler = accelerate
})

GUI.New("Brake", "Button", {
    z = 11,
    x = 230,
    y = 65,
    w = 60,
    h = 125,
    caption = "Brake",
    font = 3,
    col_txt = "txt",
    col_fill = "elm_frame",
    mousedown_handler = brake,
    mouseup_handler = stopBrake
})

--[[GUI.New("Quit", "Button", {
    z = 11,
    x = 500,
    y = 15,
    w = 75,
    h = 30,
    caption = "Quit",
    font = 3,
    col_txt = "txt",
    col_fill = "elm_frame"
})]]--

GUI.New("get_env_btn", "Button", {
    z = 11,
    x = 192,
    y = 250,
    w = 96,
    h = 20,
    caption = "Get Envelope",
    font = 3,
    col_txt = "txt",
    col_fill = "elm_frame",
    mousedown_handler = get_envelope
})

GUI.New("cur_env_txt", "Textbox", {
    z = 11,
    x = 192,
    y = 224,
    w = 96,
    h = 20,
    caption = "Tone Gate Frequency Envelope:",
    cap_pos = "left",
    font_a = 3,
    font_b = "monospace",
    color = "txt",
    bg = "wnd_bg",
    shadow = true,
    pad = 4,
    undo_limit = 20
})

frequency_slider = GUI.New("Frequency Range", "Slider", {
    z = 11,
    x = 350,
    y = 235,
    w = 96,
    caption = "Frequency Range",
    min = 20,
    max = 400,
    defaults = {83, 280},
    inc = 1,
    dir = "h",
    font_a = 3,
    font_b = 4,
    col_txt = "txt",
    col_fill = "elm_fill",
    bg = "wnd_bg",
    show_handles = true,
    show_values = true,
    cap_x = 0,
    cap_y = 0
})

GUI.Init()
GUI.func = main

GUI.freq = 0.1 -- GUI update frequency
GUI.Main()