sub InitGridScreen()
    m.GridScreen = CreateObject("roSGNode", "GridScreen")
end sub


sub ShowGridScreen()
    print "show grid screen"
    ShowScreen(m.GridScreen) ' show GridScreen
end sub

sub RemoveGridScreen()
    CloseScreen(m.GridScreen)
end sub

