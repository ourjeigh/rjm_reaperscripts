-- SETTINGS
separator = "_"
includePluginName = true
removeSpaces = true
removeCompany = true

-- MAIN
for i=0, reaper.CountSelectedMediaItems(0)-1 do
	item = reaper.GetSelectedMediaItem(0,i)
	track = reaper.GetMediaItemTrack(item)
	pluginName = ""
	fullName = ""
	if includePluginName then
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
	take = reaper.GetMediaItemTake(item, 0)
	reaper.GetSetMediaItemTakeInfo_String(take, 'P_NAME', fullName, true)
end
