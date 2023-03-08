sub init()
  m.thumbnail = m.top.findNode("thumbnail")
  
  device = CreateObject("roDeviceInfo")
  m.thumbnail.width = device.GetDisplaySize().w
  m.thumbnail.height = device.GetDisplaySize().h

  
end sub
