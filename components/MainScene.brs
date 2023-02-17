sub Init()
    ' set background color for scene. Applied only if backgroundUri has empty value
    ' m.top.backgroundColor = "0x662D91"
    m.top.backgroundUri= "https://storageconverge.blob.core.windows.net/thumbnail-photo-test/background.png"
    m.loadingIndicator = m.top.FindNode("loadingIndicator") ' store loadingIndicator node to m
    InitScreenStack()
    ShowGridScreen()
    RunContentTask() ' retrieving content
end sub