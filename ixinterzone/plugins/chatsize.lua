PLUGIN.name = "Chat Features"
PLUGIN.author = "Sasha"
PLUGIN.descripton = "Edits sizes of chat based on how loud/quiet things are spoken."

    surface.CreateFont("ixYellFont", {
        font = "ixChatFont",
        size = 40,
        weight = 1000,
        antialias = true
    })
end

hook.Add("InitializedConfig", "ixChatTypes", function()
    ix.chat.Register("y", {
        format = "%s yells \"%s\"",
        font = "ixYellFont"
        GetColor = function(self, speaker, text)
            local color = ix.chat.classes.ic:GetColor(speaker, text)

            -- Make the yell chat slightly brighter than IC chat.
            return Color(color.r + 35, color.g + 35, color.b + 35)
        end,
        CanHear = ix.config.Get("chatRange", 280) * 2,
        prefix = {"/Y", "/Yell"},
        description = "@cmdY",
        indicator = "chatYelling"
    })    
    -- run a hook after we add the basic chat classes so schemas/plugins can access their info as soon as possible if needed
    hook.Run("InitializedChatClasses")
end)