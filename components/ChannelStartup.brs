' ********** Copyright 2016 Roku Corp.  All Rights Reserved. **********

' 1st function that runs for the scene on channel startup
sub init()
  'To see print statements/debug info, telnet on port 8089
  'print "HeroScene.brs - [init]"
  m.top.backgroundUri = "https://t4.ftcdn.net/jpg/02/98/68/73/360_F_298687332_D0GAA6fAgr70NWtF8UKXPyLx0mTGug0x.jpg"
  m.NavBar = m.top.findNode("NavBar")
  m.Home = m.NavBar.findNode("Home")
  m.Show = m.NavBar.findNode("Show")
  m.Film = m.NavBar.findNode("Film")
  m.About = m.NavBar.findNode("About")
  ' HomeScreen Node with RowList

  m.HomeScreen = m.top.FindNode("HomeScreen")
  
  m.AboutScreen = m.top.FindNode("AboutScreen")

  m.FilmScreen = m.top.FindNode("FilmScreen")

  m.ShowScreen = m.top.FindNode("ShowScreen")

  ' Transitions between screens
  m.FadeIn = m.top.findNode("FadeIn")
  m.FadeOut = m.top.findNode("FadeOut")

  RenderGridContent()
  'RenderFilmContent()

end sub


function onKeyEvent(key as string, press as boolean) as boolean
  result = false
  print "in ChannelStartup onKeyEvent ";key;" "; press

  if press
    if m.top.visible = true and key = "up"
      m.Home.focusedColor = "0x4285F4"
      m.Home.setFocus(true)
    end if
    if m.Home.hasFocus() = true 
      if key = "down"
        m.HomeScreen.setFocus(true)
        toggleVisibility(m.HomeScreen)
      else if key = "right"
        m.Show.setFocus(true)
        m.Show.focusedColor = "0x4285F4"
      else if key = "left"
        m.About.setFocus(true)
        m.About.focusedColor = "0x4285F4"
      else if key = "OK"
        toggleVisibility(m.HomeScreen)
      end if
    else if m.Show.hasFocus() = true
      if key = "show down"
      else if key = "right"
        m.Film.setFocus(true)
        m.Film.focusedColor = "0x4285F4"
      else if key = "left"
        m.Home.setFocus(true)
        m.Home.focusedColor = "0x4285F4"
      else if key = "OK"
        toggleVisibility(m.ShowScreen)
        m.Show.setFocus(true)
        m.Show.focusedColor = "0x4285F4"
      end if
    else if m.Film.hasFocus() = true
      if key = "down"
        m.Film.setFocus(true)
        m.Film.focusedColor = "0x4285F4"
      else if key = "right"
        m.About.setFocus(true)
        m.About.focusedColor = "0x4285F4"
      else if key = "left"
        m.Show.setFocus(true)
        m.Show.focusedColor = "0x4285F4"
      else if key = "OK"
        print m.FilmScreen
        toggleVisibility(m.FilmScreen)
        m.Film.focusedColor = "0x4285F4"
      end if
    else if m.About.hasFocus() = true
      if key = "down"
      else if key = "right"
        m.Home.setFocus(true)
        m.Home.focusedColor = "0x4285F4"
      else if key = "left"
        m.Film.setFocus(true)
        m.Film.focusedColor = "0x4285F4"
      else if key = "OK"
        toggleVisibility(m.AboutScreen)
        m.About.setFocus(true)
        m.About.focusedColor = "0x4285F4"
      end if
    end if
  end if
end function

function toggleVisibility(screen as object)
  UnrenderGridContent()
  m.AboutScreen.visible = false
  m.HomeScreen.visible = false
  m.FilmScreen.visible = false
  m.ShowScreen.visible = false
  screen.visible = true


  if screen.id = "HomeScreen"
    RenderGridContent()
  end if

  if screen.id = "FilmScreen"
    RenderFilmContent()
  end if


end function
