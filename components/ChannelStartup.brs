' ********** Copyright 2016 Roku Corp.  All Rights Reserved. **********

' 1st function that runs for the scene on channel startup
sub init()
  'To see print statements/debug info, telnet on port 8089
  'print "HeroScene.brs - [init]"
  m.NavBar = createObject("roSGNode", "NavigationBar")

  ' HomeScreen Node with RowList
  m.HomeScreen = m.top.FindNode("HomeScreen")
  ' Transitions between screens
  m.FadeIn = m.top.findNode("FadeIn")
  m.FadeOut = m.top.findNode("FadeOut")
  ' Set focus to the scene
  m.NavBar.setFocus(true)
end sub

