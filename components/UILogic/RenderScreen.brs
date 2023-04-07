sub RenderGridContent()
  InitScreenStack()
  InitGridScreen()
  ShowGridScreen()
  RunContentTask("Grid")
end sub

sub RenderFilmContent()
  InitScreenStack()
  InitFilmScreen()
  ShowFilmScreen()
  RunContentTask("Film")
end sub

sub UnrenderGridContent()
  RemoveGridScreen()
end sub

sub UnrenderFilmContent()
  RemoveFilmScreen()
end sub