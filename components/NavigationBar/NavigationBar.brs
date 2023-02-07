sub Init()

    m.NavBar = m.top.findNode("NavBar")
    m.Home = m.top.findNode("Home")
    m.Show = m.top.findNode("Show")
    m.Film = m.top.findNode("Film")
    m.About = m.top.findNode("About")
  
  end sub
'  
'  function onKeyEvent(key as string, press as boolean) as boolean
'    print ">>> HomeScreen >> OnkeyEvent"
'    result = false
'    print "in HomeScreen.xml onKeyEvent ";key;" "; press
'    if press
'      if m.top.visible = true and key = "up"
'        print "------ [up to navbar] ------"
'        m.NavBar.setFocus(true)
'        m.NavBar.opacity = 1
'        m.Home.focusedColor = "0x4285F4"
'        m.Home.setFocus(true)
'      end if
'      if m.Home.hasFocus() = true
'        if key = "down"
'          m.RowList.setFocus(true)
'        else if key = "right"
'          print "------ [right to navbar] ------"
'          m.Show.setFocus(true)
'          m.Show.focusedColor = "0x4285F4"
'        else if key = "left"
'          m.About.setFocus(true)
'          m.About.focusedColor = "0x4285F4"
'        end if
'      else if m.Show.hasFocus() = true
'        if key = "down"
'          m.RowList.setFocus(true)
'        else if key = "right"
'          print "------ [right to navbar] ------"
'          m.Film.setFocus(true)
'          m.Film.focusedColor = "0x4285F4"
'        else if key = "left"
'          m.Home.setFocus(true)
'          m.Home.focusedColor = "0x4285F4"
'        end if
'      else if m.Film.hasFocus() = true
'        if key = "down"
'          m.RowList.setFocus(true)
'        else if key = "right"
'          print "------ [right to navbar] ------"
'          m.About.setFocus(true)
'          m.About.focusedColor = "0x4285F4"
'        else if key = "left"
'          m.Show.setFocus(true)
'          m.Show.focusedColor = "0x4285F4"
'        end if
'      else if m.About.hasFocus() = true
'        if key = "down"
'          m.RowList.setFocus(true)
'        else if key = "right"
'          print "------ [right to navbar] ------"
'          m.Home.setFocus(true)
'          m.Home.focusedColor = "0x4285F4"
'        else if key = "left"
'          m.Film.setFocus(true)
'          m.Film.focusedColor = "0x4285F4"
'        end if
'      end if
'    end if
'  end function