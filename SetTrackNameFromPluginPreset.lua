-- SETTINGS
separator = "-"
includePluginName = true
removeSpaces = true
removeCompany = true

-- MAIN
trackID = 0
track = reaper.GetSelectedTrack(0, trackID)
fullName = ""
if includePluginName then
	pluginName = ""
	success, pluginName = reaper.TrackFX_GetFXName(track, 0, pluginName)
	pluginName = string.gsub(pluginName, "VST.*: ","")
	if removeCompany then
		pluginName = string.gsub(pluginName, "%(.*%)","")
	end
	presetName = ""
	success, presetName = reaper.TrackFX_GetPreset( track, 0, presetName)
	fullName = string.format("%s%s%s",pluginName,separator, presetName)
else
	presetName = ""
	success, presetName = reaper.TrackFX_GetPreset( track, 0, presetName)
	fullName = presetName
end
if removeSpaces then
	fullName= string.gsub(fullName, "%s", "")
end
reaper.GetSetMediaTrackInfo_String(track, "P_NAME", fullName, true)
