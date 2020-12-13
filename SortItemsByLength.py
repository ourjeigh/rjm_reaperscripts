itemCount = RPR_CountSelectedMediaItems(0)
startTime = RPR_GetMediaItemInfo_Value(RPR_GetSelectedMediaItem(0,0), "D_POSITION")
#RPR_ShowConsoleMsg(startTime)
selectedItems={}
i = 0
while i < itemCount:
  item = RPR_GetSelectedMediaItem(0,i)
  length = RPR_GetMediaItemInfo_Value(item, "D_LENGTH")
  #RPR_ShowConsoleMsg(length)
  selectedItems[length] = item
  i+=1

for key in sorted(selectedItems.iterkeys()):
  RPR_SetMediaItemInfo_Value(selectedItems[key], "D_POSITION", startTime)
  #RPR_ShowConsoleMsg(startTime)
  startTime = startTime + key + 0.1

