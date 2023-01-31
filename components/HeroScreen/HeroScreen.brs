' ********** Copyright 2016 Roku Corp.  All Rights Reserved. **********

' Called when the HeroScreen component is initialized
sub Init()
  'Uncomment the print statements to see where and when the functions are called
  'print "HeroScreen.brs - [init]"

  'Get references to child nodes
  m.RowList = m.top.findNode("RowList")
  m.background = m.top.findNode("Background")

  m.NavBar = m.top.findNode("NavBar")

  m.Home = m.top.findNode("Home")
  m.Show = m.top.findNode("Show")
  m.Film = m.top.findNode("Film")
  m.About = m.top.findNode("About")


  'Create a task node to fetch the UI content and populate the screen
  m.UriHandler = CreateObject("roSGNode", "UriHandler")
  m.UriHandler.observeField("content", "onContentChanged")

  'Make a request for each "row" in the UI (in the order that you want content filled)
  URLs = [
    ' Uncomment this line to simulate a bad request and make the dialog box appear
    ' "bad request",
    "http://devtools.web.roku.com/samples/sample_content.rss",
    "http://devtools.web.roku.com/samples/sample_content.rss",
    "http://devtools.web.roku.com/samples/sample_content.rss",
    "http://devtools.web.roku.com/samples/sample_content.rss"
  ]
  makeRequest(URLs, "Parser")

  'Create observer events for when content is loaded
  m.top.observeField("visible", "onVisibleChange")
  m.top.observeField("focusedChild", "OnFocusedChildChange")
end sub

' Issues a URL request to the UriHandler component
sub makeRequest(URLs as object, ParserComponent as string)
  'print "HeroScreen.brs - [makeRequest]"
  for i = 0 to URLs.count() - 1
    context = createObject("roSGNode", "Node")
    uri = { uri: URLs[i] }
    if type(uri) = "roAssociativeArray"
      context.addFields({
        parameters: uri,
        num: i,
        response: {}
      })
      m.UriHandler.request = {
        context: context
        parser: ParserComponent
      }
    end if
  end for
end sub

' observer function to handle when content loads
sub onContentChanged()
  'print "HeroScreen.brs - [onContentChanged]"
  m.top.numBadRequests = m.UriHandler.numBadRequests
  m.top.content = m.UriHandler.content
end sub

function onKeyEvent(key as string, press as boolean) as boolean
  print ">>> HeroScreen >> OnkeyEvent"
  result = false
  print "in HeroScreen.xml onKeyEvent ";key;" "; press
  if press
    if m.top.visible = true and key = "up"
      print "------ [up to navbar] ------"
      m.NavBar.setFocus(true)
      m.NavBar.opacity = 1
      m.Home.focusedColor = "0x4285F4"
      m.Home.setFocus(true)
    end if
    if m.Home.hasFocus() = true
      if key = "down"
        m.RowList.setFocus(true)
      else if key = "right"
        print "------ [right to navbar] ------"
        m.Show.setFocus(true)
        m.Show.focusedColor = "0x4285F4"
      else if key = "left"
        m.About.setFocus(true)
        m.About.focusedColor = "0x4285F4"
      end if
    else if m.Show.hasFocus() = true
      if key = "down"
        m.RowList.setFocus(true)
      else if key = "right"
        print "------ [right to navbar] ------"
        m.Film.setFocus(true)
        m.Film.focusedColor = "0x4285F4"
      else if key = "left"
        m.Home.setFocus(true)
        m.Home.focusedColor = "0x4285F4"
      end if
    else if m.Film.hasFocus() = true
      if key = "down"
        m.RowList.setFocus(true)
      else if key = "right"
        print "------ [right to navbar] ------"
        m.About.setFocus(true)
        m.About.focusedColor = "0x4285F4"
      else if key = "left"
        m.Show.setFocus(true)
        m.Show.focusedColor = "0x4285F4"
      end if
    else if m.About.hasFocus() = true
      if key = "down"
        m.RowList.setFocus(true)
      else if key = "right"
        print "------ [right to navbar] ------"
        m.Home.setFocus(true)
        m.Home.focusedColor = "0x4285F4"
      else if key = "left"
        m.Film.setFocus(true)
        m.Film.focusedColor = "0x4285F4"
      end if
    end if
  end if
end function