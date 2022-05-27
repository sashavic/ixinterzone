netstream.Hook("Frequency", function(oldFrequency)
	Derma_StringRequest("Frequency", "What would you like to set the frequency to?", oldFrequency, function(text)
		ix.command.Send("SetFreq", text)
	end)
end)

-- Disables the crosshair permanently.
function Schema:CharacterLoaded(character)
	self:ExampleFunction("@serverWelcome", character:GetName())
end

