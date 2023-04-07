sub InitGridScreen()
    m.GridScreen = CreateObject("roSGNode", "GridScreen")
end sub

sub InitFilmScreen()
    m.FilmScreen = CreateObject("roSGNode", "FilmScreen")
end sub

sub ShowGridScreen()
    ShowScreen(m.GridScreen) ' show GridScreen
end sub

sub RemoveGridScreen()
    CloseScreen(m.GridScreen)
end sub

sub ShowFilmScreen()
    ShowScreen(m.FilmScreen) ' show GridScreen
    m.FilmScreen.visible = true
end sub

sub RemoveFilmScreen()
    m.FilmScreen.visible = false
end sub


