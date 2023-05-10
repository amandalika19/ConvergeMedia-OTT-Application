sub Init()
    ' set the name of the function in the Task node component to be executed when the state field changes to RUN
    ' in our case this method executed after the following cmd: m.contentTask.control = "run"(see Init method in MainScene)
    m.top.functionName = "GetContent"
end sub

sub GetContent()
    ' request the content feed from the API
    xfer = CreateObject("roURLTransfer")
    xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    ' xfer.SetURL("https://storageconverge.blob.core.windows.net/content-feed/ottContentFeed.json")''"https://storageconverge.blob.core.windows.net/test/content-test.json")
    xfer.SetURL("https://convergemedia.azurewebsites.net/videos/series/1")
    rsp = xfer.GetToString()
    rootSeriesChildren = []
    rootFilmChildren = []
    json = ParseJson(rsp)
    if json <> invalid
        for each category in json
            row = {}
            row.title = category.title
            row.children = []
            itemData = GetItemData(category)
            row.children.Push(itemData)
            rootSeriesChildren.Push(row)
        end for
        ' set up a root ContentNode to represent rowList on the GridScreen
        contentSeriesNode = CreateObject("roSGNode", "ContentNode")
        contentSeriesNode.Update({
            children: rootSeriesChildren
        }, true)

        m.top.contentSeries = contentSeriesNode
    end if
end sub

function GetItemData(video as Object) as Object
    item = {}
    ' populate some standard content metadata fields to be displayed on the GridScreen
    ' https://developer.roku.com/docs/developer-program/getting-started/architecture/content-metadata.md
    if video.description <> invalid
        item.description = video.description
    else
        item.description = "No Description Available"
    end if

    item.hdPosterURL = video.thumbnail
    item.title = video.title
    item.releaseDate = video.uploadDate
    item.id = video.id
    item.length = video.runtime
    item.url = video.source

    return item
end function
