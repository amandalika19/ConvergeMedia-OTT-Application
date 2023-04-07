sub RenderGridContent()
  InitScreenStack()
  InitGridScreen()
  ShowGridScreen()
  RunContentTask("Grid")
  print m.screenStack
end sub

sub RenderFilmContent()
  InitScreenStack()
  InitFilmScreen()
  ShowFilmScreen()
  RunContentTask("Film")
  print m.screenStack
end sub
sub RenderShowContent()
  InitScreenStack()
  InitShowScreen()
  ShowShowScreen()
  RunContentTask("Show")
  print m.screenStack
end sub

sub UnrenderGridContent()
  RemoveGridScreen()
end sub

sub UnrenderFilmContent()
  RemoveFilmScreen()
end sub
sub UnrenderShowContent()
  RemoveShowScreen()
end sub