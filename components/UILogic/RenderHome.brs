sub RenderGridContent()
  InitScreenStack()
  InitGridScreen()
  ShowGridScreen()
  RunContentTask()
end sub


sub UnrenderGridContent()
  RemoveGridScreen()
  RunContentTask()
end sub