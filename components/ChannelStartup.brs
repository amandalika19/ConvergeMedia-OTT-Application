' ********** Copyright 2016 Roku Corp.  All Rights Reserved. **********

' 1st function that runs for the scene on channel startup
sub init()
  'To see print statements/debug info, telnet on port 8089
  'print "HeroScene.brs - [init]"
  m.NavBar = m.top.findNode("NavBar")
  m.Home = m.NavBar.findNode("Home")
  m.Show = m.NavBar.findNode("Show")
  m.Film = m.NavBar.findNode("Film")
  m.About = m.NavBar.findNode("About")
  ' HomeScreen Node with RowList
  m.HomeScreen = m.top.FindNode("HomeScreen")
  m.HomeLabel = m.HomeScreen.FindNode("homerow")

  m.AboutScreen = m.top.FindNode("AboutScreen")
  m.AboutLabel = m.AboutScreen.FindNode("aboutrow")

  m.FilmScreen = m.top.FindNode("FilmScreen")
  m.FilmLabel = m.FilmScreen.FindNode("filmrow")

  m.ShowScreen = m.top.FindNode("ShowScreen")
  m.ShowLabel = m.ShowScreen.FindNode("showrow")

  ' Transitions between screens
  m.FadeIn = m.top.findNode("FadeIn")
  m.FadeOut = m.top.findNode("FadeOut")
  ' Set focus to the scene
  m.top.setFocus(true)
end sub

function onKeyEvent(key as string, press as boolean) as boolean
  print ">>> HomeScreen >> OnkeyEvent"
  result = false
  print "in HomeScreen.xml onKeyEvent ";key;" "; press
  if press
    if m.top.visible = true and key = "up"
      print "------ [up to navbar] ------"
      m.Home.focusedColor = "0x4285F4"
      m.Home.setFocus(true)
    end if
    if m.Home.hasFocus() = true
      if key = "down"
        m.HomeLabel.setFocus(true)
      else if key = "right"
        print "------ [right to navbar] ------"
        m.Show.setFocus(true)
        m.Show.focusedColor = "0x4285F4"
      else if key = "left"
        m.About.setFocus(true)
        m.About.focusedColor = "0x4285F4"
      else if key = "OK"
        toggleVisibility(m.HomeScreen)
      end if
    else if m.Show.hasFocus() = true
      if key = "down"
        m.HomeLabel.setFocus(true)
      else if key = "right"
        print "------ [right to navbar] ------"
        m.Film.setFocus(true)
        m.Film.focusedColor = "0x4285F4"
      else if key = "left"
        m.Home.setFocus(true)
        m.Home.focusedColor = "0x4285F4"
      else if key = "OK"
        toggleVisibility(m.ShowScreen)
      end if
    else if m.Film.hasFocus() = true
      if key = "down"
        m.HomeLabel.setFocus(true)
      else if key = "right"
        print "------ [right to navbar] ------"
        m.About.setFocus(true)
        m.About.focusedColor = "0x4285F4"
      else if key = "left"
        m.Show.setFocus(true)
        m.Show.focusedColor = "0x4285F4"
      else if key = "OK"
        toggleVisibility(m.FilmScreen)
      end if
    else if m.About.hasFocus() = true
      if key = "down"
        m.itemMask.setFocus(true)
      else if key = "right"
        print "------ [right to navbar] ------"
        m.Home.setFocus(true)
        m.Home.focusedColor = "0x4285F4"
      else if key = "left"
        m.Film.setFocus(true)
        m.Film.focusedColor = "0x4285F4"
      else if key = "OK"
        toggleVisibility(m.AboutScreen)
      end if

    end if
  end if
end function

function toggleVisibility(screen as object)
  m.AboutScreen.visible = false
  m.HomeScreen.visible = false
  m.FilmScreen.visible = false
  m.ShowScreen.visible = false
  screen.visible = true
end function
