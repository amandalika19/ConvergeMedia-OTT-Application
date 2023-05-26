sub Init()
    ' set the name of the function in the Task node component to be executed when the state field changes to RUN
    ' in our case this method executed after the following cmd: m.contentTask.control = "run"(see Init method in MainScene)
    m.top.functionName = "GetContent"
end sub

sub GetContent()
    ' request the content feed from the API
    xfer = CreateObject("roURLTransfer")
    xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    url_show_list = ["https://convergemedia.azurewebsites.net/videos/series/5",
    "https://convergemedia.azurewebsites.net/videos/series/7",
    "https://convergemedia.azurewebsites.net/videos/series/8",
    "https://convergemedia.azurewebsites.net/videos/series/9"]
    show_title = ["The Truth With Proof", "Art of The Matter", "Support Black Business","The Morning Update Show"]
    url_film_list = []
    film_title = []
    rootSeriesChildren = []
    rootFilmChildren = []
    if Count(url_show_list) > 0
        for x = 0 To Count(url_show_list)
            xfer.SetURL(url_show_list[x])
            rsp = xfer.GetToString()
            json = ParseJson(rsp)
            row = {}
            row.children = []
            row.title = show_title[x]
            if json <> invalid
                for each category in json
                    itemData = GetItemData(category)
                    row.children.Push(itemData)
                    rootSeriesChildren.Push(row)
                end for
            end if
        end for
    end if

    if Count(url_film_list) > 0
        for y = 0 To Count(url_film_list)
            xfer.SetURL(url_film_list[x])
            rsp = xfer.GetToString()
            json = ParseJson(rsp)
            row = {}
            row.children = []
            row.title = film_title[x]
            if json <> invalid
                for each category in json
                    itemData = GetItemData(category)
                    row.children.Push(itemData)
                    rootFilmChildren.Push(row)
                end for
            end if
        end for
    end if
    ' set up a root ContentNode to represent rowList on the GridScreen
    contentSeriesNode = CreateObject("roSGNode", "ContentNode")
    contentSeriesNode.Update({
        children: rootSeriesChildren
    }, true)
    contentFilmilmNode = CreateObject("roSGNode", "ContentNode")
    contentFilmilmNode.Update({
        children: rootFilmChildren
    }, true)

    m.top.contentSeries = contentSeriesNode
    m.top.contentFilm = contentFilmilmNode
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
    item.url = video.source[0]

    return item
end function
